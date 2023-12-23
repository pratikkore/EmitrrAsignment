var express = require("express");
var router = express.Router();
var database = require("./database.js");

router.get("/language-list", (req, res) => {
  database.query("SELECT * from languagelsit", (error, data) => {
    if (error) {
      return res.json({ status: "ERROR", error });
    }

    return res.json(data);
  });
});

router.get("/question-list/:langId", (req, res) => {
  const id = req.params.langId;
  console.log(id);
  database.query(
    "SELECT * from questions WHERE LanguageId = " + id,
    (error, data) => {
      if (error) {
        return res.json({ status: "ERROR", error });
      }
      if (data && data.length > 0) {
        data.forEach((d, i) => {
          database.query(
            "select * from optionstable WHERE QuestionId=" +
              d.Id +
              " AND LanguageId=" +
              id,
            (error, data1) => {
              console.log(data1);
              d["optionData"] = data1;
              if (data.length - 1 == i) {
                return res.json(data);
              }
            }
          );
        });
      }
    }
  );
});

router.get("/question-ans", (req, res) => {
  // console.log(JSON.parse(req.query.data).length);
  // const qId = req.params.queId;
  // const ansId = req.params.ansId;
  try {
    let totalMarks = 0;
    let fData = [];
    const answers = JSON.parse(req.query.data);
    console.log(answers);
    answers.forEach((element, i) => {
      database.query(
        "SELECT * from answerlist WHERE QuesionId =" +
          element.Id +
          " AND OptionId = " +
          element.optionId,
        (error, data) => {
          if (error) {
            return res.json({ status: "ERROR", error });
          }
          console.log(data);
          if (data && data.length > 0) {
            fData.push(data[0]);
            totalMarks += data[0].Marks;
          }
          if (answers.length - 1 === i) {
            console.log(totalMarks, "cf");
            return res.json({
              status: 200,
              data: { data: fData, totalMarks: totalMarks },
            });
          }
          console.log(totalMarks);
        }
      );
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Unable to fetch users" });
  }
});

router.post("/login", (req, res) => {
  const { UserName, Password } = req.body;
  console.log(UserName + " is " + Password);
  database.query(
    "SELECT roleid from user WHERE email='" +
      UserName +
      "' AND password = " +
      Password,
    (error, data) => {
      if (error) {
        return res.json({ status: "ERROR", error });
      }
      if (data.length) {
        return res.json({ status: 200, data: data[0] });
      } else {
        return res.json({ status: "404", msg: "USER NOT FOUND" });
      }
    }
  );
});

module.exports = router;
