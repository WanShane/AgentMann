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
首先想到了利用空气，来源于空气的风来触动用户的肌肤。关于“风”的设想将在以后实施实验。<br>

# Supporting daily life of elderly in dementia by using a virtual agent
This is an university research project I am doing now.<br>
First of all, let me introduce this thing in details.<br>
The project I am working on is an agent designed to support the lives of elderly dementia patients. <br>
Currently, caregiving for elderly dementia patients is mostly done manually. However, due to a shortage of caregivers and high labor costs, caregiving facilities (such as nursing homes and hospitals) often have one caregiver assigned to multiple dementia patients.<br>
In China, many families with dementia patients choose to provide care themselves, which puts a lot of burden on the family members. <br>
Additionally, there is a caregiving method called "Humanitude" that has been successfully implemented in Japan and has shown positive effects in dementia care. It involves specific techniques such as attention, dialogue, touch, and assisted standing.<br>
The specific approach is as follows:<br>
Approach the patient from the front and gradually move closer, making eye contact with the patient for about 3 seconds, and then initiate a conversation.<br>
Choose positive topics for conversation and combine them with attention and touch.<br>
If there is no response within 3 minutes, pause the caregiving approach for the dementia patient.<br>
Because this approach combines perception, emotion, and language, I aim to design an agent system that incorporates the techniques of Humanitude to assist family members and caregivers in caring for dementia patients.<br>
The visual aspect of Humanitude's "attention" technique will be achieved through the agent's visual representation. For this part, I will use processing to implement the appearance of the agent. By using faceAPI to recognize the user's facial orientation and passing the collected data to processing, the agent's movements will be controlled to create the effect of the agent gradually approaching the user.<br>
The "dialogue" aspect of Humanitude will be implemented through conversations between the agent and the user. The specific method for this part is still under discussion.<br>
The "touch" technique of Humanitude will be achieved through a tactile device. Whether to use a wearable device or non-body contact form is still being explored. Considering the potential aversion of elderly dementia patients to wearable devices, a non-wearable device will be used. The challenge lies in how to create the sensation of "touch" without physical contact. One idea is to use air and airflow to stimulate the user's skin. An experiment involving the concept of "wind" will be conducted in future.
