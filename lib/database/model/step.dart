import 'package:flutter_app/database/model/pray.dart';

class Praystep {
  Pray pray;
  Praystep(this.pray);
  Map<int, dynamic> toMap() {
    var map = new Map<int, dynamic>();
    map[1]	=	   ["敬拜尊崇",pray.ptxt,pray.pcmt,pray.pref,""];
    map[2]	=	   ["认罪悔改",pray.ctxt,pray.ccmt,pray.cref,""];
    map[3]	=	   ["恢复更新",pray.rtxt,pray.rcmt,pray.rref,""];
    map[4]	=	   ["个人祈求",pray.ttxt,pray.tcmt,pray.tref,"停下来请求神赐给你恩典成长敬虔的品格。"];
    map[5]	=	   ["彼此代求",pray.itxt,pray.icmt,pray.iref,"停下来反思你同他人的关系，并将他们交托给神。"];
    map[6]	=	   ["信靠顺服",pray.atxt,pray.acmt,pray.aref,""];
    map[7]	=	   ["感恩",pray.ntxt,pray.ncmt,pray.nref,""];
    map[8]	=	   ["结束祷告",pray.ltxt,"",pray.lref,"结束祷告。"];
  //  map[9]	=	   ["后记",    "祷告是基督徒的权力和义务。生命的成长离不开祷告。圣经教导我们要常常祷告。圣经中记载了无数的祷告。神听我们的祷告。耶稣基督也在天上为我们祷告。读经需要祷告，让圣灵带领并开启我们心灵的眼睛，使我们能听到并明白神所要教导我们的。另一方面，读经过程中，神的话会感动我们，有的让我们看到自己的罪，有的让我们看到人们需要主，有的鼓舞我们对神的信心，有的让我们感谢赞美神。这些都可以带到主面前。所以有一种祷告方式叫祷告圣经。就是将神的话向神祷告回去，同时领会神的话对我们的提醒，再向神摆上我们自己的赞美，祈求和感恩。此软件就是为此而作。此程序偏重灵命成长通过祷告神的话。 \n\n内容根据<<Hand Book To Renewal>>(Kenneth Boa)翻译编集而成。 \n\n此程序由胡益光弟兄和陈彪博士（牧师）合作完成。"

    map[9]	=	   ["后记",    "彼未祈、我已應之、尚言時、我已允之。（以赛亚65：24）\n\n内容根据<<Hand Book To Renewal>>(Kenneth Boa)翻译编集而成。 \n\n胡益光，陈彪"
    ,"","",""];

    return map;
  }

}