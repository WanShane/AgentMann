# 老年痴呆患者生活支援agent
这是我在大学里正在做的一个课题。<br>
首先，介绍一下我正在做的事情：<br>
我在做的课题是用于支援老年痴呆症生活的agent。<br>
因为现在介护老年痴呆患者的方式普遍为人工，然而人手不足和人工费高昂，所以介护场所（敬老院，医院）的现状是一位介护者对应多人老年痴呆患者。<br>
在中国，更多的有老年痴呆患者的家庭采取的是亲属介护的手段对老年痴呆患者进行照顾，另外家人也因为照顾老年痴呆患者感到非常辛苦。<br>
另外，现在有一个叫做[Humanitude](http://www.infiressources.ca/fer/depotdocument_anglais/the_concept_of_Humanitude_as_applied_to_general_nursing_care.pdf)的介护方法在日本被实际运用并且起到了一定的介护效果。它提供了照顾老年痴呆患者的方式，基本技法是注目，对话，触摸和辅助站立。<br>
具体做法是：<br>
从正面进入患者视野并且逐渐贴近患者面部，与患者四目相对将近3秒后，由介护者开始发起会话。<br>
谈话时挑选内容积极向上的话题，并且要结合注目和触摸。<br>
如果3分钟之内得不到回应，暂停对老年痴呆患者的介护。<br>
因为这种基本手法结合了知觉、情感和语言，所以我希望设计一个结合了humanitude介护技法的agent系统，来帮助照顾老年痴呆患者的亲属和介护现场的工作人员。<br>
①通过agent的在视觉方面的表现，完成humanitude的“注目”技法。<br>
对于这一部分，我采用processing来实现agent的外观。<br>
为实现agent随着用户的面部方向移动，并让用户感受到agent向自己的方向逐渐靠近的效果，<br>
我采用了[faceAPI](http://www.ekstremmakina.com/EKSTREM/product/faceapi/downloads/index.html)对用户的面部朝向进行识别，<br>
并将采集到数据传递到processing，用以控制agent的行动坐标。<br>
另：现在faceAPI的下载功能被取消了。研究室还存有faceAPI老版本。
②通过agent与用户的对话来完成humanitude的“对话”技法。<br>
这一部分具体采用什么方法来实现，还在探讨中。<br>
③通过触觉装置来实现humanitude的“触摸”技法。<br>
~这一部分是利用身体佩戴形式还是非身体接触形式来制造触感，还在探索。<br>~
考虑到若使用穿戴式装置来实现身体触摸，用户（老年痴呆患者）会有很高的可能性产生厌恶感。因此，使用非穿戴式的装置来实现。<br>
于是，问题变成了在没有身体接触的情况如何实现“触摸”的感觉。<br>
首先想到了利用空气，来源于空气的风来触动用户的肌肤。关于“风”的实验将在2019年1月实施实验。<br>

# Supporting daily life of elderly in dementia by using a virtual agent
This is an university research project I am doing now.<br>
First of all, let me introduce this thing in details.<br>
This project is aimed of supporting dementia elderly's daily life.<br>
