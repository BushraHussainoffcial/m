import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/models/drawer_item_model.dart';
import 'package:mardod/core/models/home_item_explore_model.dart';
import 'package:mardod/core/models/record_item_model.dart';
import 'package:mardod/core/strings.dart';

class Constants {
  static const double widthSize = 414.0;
  static const double heightSize = 896.0;

  static const int splashDelayed = 5;

  static const double buttonHeight = 54;

  static List<HomeItemExploreModel> homeExploreItems = [
    HomeItemExploreModel(
        name: Strings.eventsAndActivitiesText,
        icon: AssetsManager.eventsAndActivitiesIMG),
    HomeItemExploreModel(
        name: Strings.restaurantsAndCafesText,
        icon: AssetsManager.restaurantsAndCafesIMG),
    HomeItemExploreModel(
        name: Strings.shoppingAndOffersText,
        icon: AssetsManager.shoppingAndOffersIMG),
    HomeItemExploreModel(
        name: Strings.trainingProgramsText,
        icon: AssetsManager.trainingProgramsIMG),
    HomeItemExploreModel(
        name: Strings.eventsAndActivitiesText,
        icon: AssetsManager.eventsAndActivitiesIMG),
    HomeItemExploreModel(
        name: Strings.restaurantsAndCafesText,
        icon: AssetsManager.restaurantsAndCafesIMG),
    HomeItemExploreModel(
        name: Strings.shoppingAndOffersText,
        icon: AssetsManager.shoppingAndOffersIMG),
    HomeItemExploreModel(
        name: Strings.trainingProgramsText,
        icon: AssetsManager.trainingProgramsIMG),
    HomeItemExploreModel(
        name: Strings.eventsAndActivitiesText,
        icon: AssetsManager.eventsAndActivitiesIMG),
    HomeItemExploreModel(
        name: Strings.restaurantsAndCafesText,
        icon: AssetsManager.restaurantsAndCafesIMG),
    HomeItemExploreModel(
        name: Strings.shoppingAndOffersText,
        icon: AssetsManager.shoppingAndOffersIMG),
    HomeItemExploreModel(
        name: Strings.trainingProgramsText,
        icon: AssetsManager.trainingProgramsIMG),
  ];

  static List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
      icon: AssetsManager.homeIconIMG,
      name: Strings.homePageText,
    ),
    DrawerItemModel(
        icon: AssetsManager.logIconIMG,
        name: Strings.logText,
        route: '/recordRoute'),
    DrawerItemModel(
      icon: AssetsManager.clearLogIconIMG,
      name: Strings.clearLogText,
    ),
    DrawerItemModel(
      icon: AssetsManager.freeSpaceIconIMG,
      name: Strings.freeSpaceText,
    ),
  ];

  static List<String> popularTitlesList = [
  'سينما فوكس',
  'مهرجان عزيز مول',
  'ملاهي الشلال',
  'جدة بارك',
  ];
  static List<RecordItemModel> recordItems = [
    RecordItemModel(
        title: 'ما هي الأنشطة الجبلية المتاحة في الطائف؟',
        date: '17 Sep 2023 11:21 AM'),
    RecordItemModel(
        title: 'فين أحصل محلات تبيع عسل أصلي بأبها؟',
        date: '16 Sep 2023 11:21 AM'),
    RecordItemModel(
        title: 'وش الأنشطة العائلية اللي ممكن نسويها بالمدينة؟',
        date: '16 Sep 2023 11:21 AM'),
    RecordItemModel(
        title: 'وين أفضل مطاعم تقدم أكلات شعبية بالرياض؟',
        date: '16 Sep 2023 11:21 AM'),
    RecordItemModel(
        title: 'وين ألقى هدايا حلوة للحجاج والمعتمرين في مكة؟',
        date: '16 Sep 2023 11:21 AM'),
    RecordItemModel(
        title: 'وش أفضل مطاعم على البحر بجدة؟', date: '17 Sep 2023 11:21 AM'),
  ];

  static const List<String> socialMediaList=[
    AssetsManager.xIconIMG,
    AssetsManager.googleIconIMG,
    AssetsManager.facebookIconIMG,
  ];

  static const termsAndConditionsText = """
  <p>آخر تحديث في 22 يناير 2025</p>
<p>الموافقة على شروطنا القانونية</p>
<p>نحن شركة MARDOD CO ("الشركة" أو "نحن" أو "لنا").</p>
<p>نحن ندير تطبيق MARDOD للجوال ("التطبيق")، بالإضافة إلى أي منتجات وخدمات أخرى ذات صلة تشير إلى هذه الشروط القانونية أو ترتبط بها ("الشروط القانونية") (يُشار إليها مجتمعة باسم "الخدمات").</p>
<p>تشكل هذه الشروط القانونية اتفاقية ملزمة قانونًا بينك، سواء شخصيًا أو نيابة عن كيان ("أنت")، وشركة MARDOD CO، فيما يتعلق بوصولك إلى الخدمات واستخدامك لها. أنت توافق على أنه من خلال الوصول إلى الخدمات،</p>
<p>لقد قرأت وفهمت ووافقت على الالتزام بجميع هذه الشروط القانونية. إذا كنت لا توافق على جميع هذه الشروط القانونية، فيُحظر عليك صراحةً استخدام الخدمات ويجب عليك التوقف عن استخدامها على الفور.</p>
<p>سنقوم بتزويدك بإشعار مسبق بأي تغييرات مجدولة على الخدمات التي تستخدمها. ستصبح الشروط القانونية المعدلة سارية المفعول عند نشرها أو إخطارك بها كما هو مذكور في رسالة البريد الإلكتروني. من خلال الاستمرار في استخدام الخدمات بعد تاريخ سريان أي تغييرات، فإنك توافق على الالتزام بالشروط المعدلة.</p>
<p>الخدمات مخصصة للمستخدمين الذين تبلغ أعمارهم 13 عامًا على الأقل. يجب أن يحصل جميع المستخدمين القاصرين في الولاية القضائية التي يقيمون فيها (عادةً أقل من 18 عامًا) على إذن من ولي أمرهم أو الوصي عليهم وأن يخضعوا لإشرافه المباشر لاستخدام الخدمات. إذا كنت قاصرًا، فيجب أن يطلب من ولي أمرك أو الوصي عليك قراءة هذه الشروط القانونية والموافقة عليها قبل استخدامك للخدمات.</p>
<p>نوصيك بطباعة نسخة من هذه الشروط القانونية للاحتفاظ بها في سجلاتك.</p>
<p><strong>جدول المحتويات</strong></p>
<ol>
<li><strong> خدماتنا</strong></li>
<li><strong> حقوق الملكية الفكرية</strong></li>
<li><strong> تصريحات المستخدم</strong></li>
<li><strong> تسجيل المستخدم</strong></li>
<li><strong> الأنشطة المحظورة</strong></li>
<li><strong> المساهمات التي ينشئها المستخدم</strong></li>
<li><strong> ترخيص المساهمة</strong></li>
<li><strong> ترخيص تطبيقات الهاتف المحمول</strong></li>
<li><strong> وسائل التواصل الاجتماعي</strong></li>
<li><strong> مواقع الطرف الثالث والمحتوى</strong></li>
<li><strong> المعلنون</strong></li>
<li><strong> إدارة الخدمات</strong></li>
<li><strong> المدة والإنهاء</strong></li>
<li><strong> التعديلات والانقطاعات</strong></li>
<li><strong> القانون الحاكم</strong></li>
<li><strong> حل النزاعات</strong></li>
<li><strong> التصحيحات</strong></li>
<li><strong> إخلاء المسؤولية</strong></li>
<li><strong> قيود المسؤولية</strong></li>
<li><strong> التعويض</strong></li>
<li><strong> بيانات المستخدم</strong></li>
<li><strong> الاتصالات الإلكترونية والمعاملات والتوقيعات</strong></li>
<li><strong> أحكام عامة</strong></li>
<li><strong> الاتصال بنا</strong></li>
<li><strong> خدماتنا</strong></li>
</ol>
<p>لا يُقصد من المعلومات المقدمة عند استخدام الخدمات توزيعها على أي شخص أو كيان أو استخدامها في أي ولاية قضائية أو بلد حيث يكون هذا التوزيع أو الاستخدام مخالفًا للقانون أو اللوائح أو الذي من شأنه أن يُخضعنا لأي متطلب تسجيل ضمن هذه الولاية القضائية أو البلد. وعليه، فإن الأشخاص الذين يختارون الوصول إلى الخدمات من مواقع أخرى يفعلون ذلك بمبادرة منهم وهم وحدهم المسؤولون عن الامتثال للقوانين المحلية، إذا كانت القوانين المحلية قابلة للتطبيق وإلى الحد الذي تنطبق فيه.</p>
<ol start="2">
<li><strong> حقوق الملكية الفكرية</strong></li>
</ol>
<p><strong>ملكيتنا الفكرية</strong></p>
<p>نحن المالكون أو المرخصون لجميع حقوق الملكية الفكرية في خدماتنا، بما في ذلك جميع أكواد المصدر وقواعد البيانات والوظائف والبرامج وتصميمات مواقع الويب والصوت والفيديو والنصوص والصور والرسومات في الخدمات (يُشار إليها مجتمعة باسم "المحتوى")، بالإضافة إلى العلامات التجارية وعلامات الخدمة والشعارات الواردة فيها (يُشار إليها باسم "العلامات").</p>
<p>يخضع المحتوى والعلامات الخاصة بنا لحماية قوانين حقوق النشر والعلامات التجارية (وقوانين الملكية الفكرية الأخرى المختلفة وقوانين المنافسة غير العادلة) والمعاهدات في جميع أنحاء العالم.</p>
<p>يتم توفير المحتوى والعلامات في الخدمات أو من خلالها "كما هي" لاستخدامك الشخصي غير التجاري أو لأغراض العمل الداخلية فقط.</p>
<p><strong>استخدامك لخدماتنا</strong></p>
<p>وفقًا لامتثالك لهذه الشروط القانونية، بما في ذلك قسم "الأنشطة المحظورة" أدناه، فإننا نمنحك ترخيصًا غير حصري وغير قابل للتحويل وقابل للإلغاء من أجل:</p>
<ul>
<li>الوصول إلى الخدمات؛ و</li>
<li>تنزيل أو طباعة نسخة من أي جزء من المحتوى الذي حصلت على حق الوصول إليه،</li>
</ul>
<p>فقط لاستخدامك الشخصي غير التجاري أو لأغراض تجارية داخلية.</p>
<p>باستثناء ما هو منصوص عليه في هذا القسم أو في أي مكان آخر في شروطنا القانونية، لا يجوز نسخ أي جزء من الخدمات أو أي محتوى أو علامات أو إعادة إنتاجه أو تجميعه أو إعادة نشره أو تحميله أو نشره أو عرضه علنًا أو ترميزه أو ترجمته أو إرساله أو توزيعه أو بيعه أو ترخيصه أو استغلاله بأي شكل من الأشكال لأي غرض تجاري مهما كان، دون الحصول على إذن كتابي صريح مسبق منا.</p>
<p>إذا كنت ترغب في استخدام الخدمات أو المحتوى أو العلامات بخلاف ما هو منصوص عليه في هذا القسم أو في أي مكان آخر في شروطنا القانونية، فيرجى توجيه طلبك إلى: mardod@gmail.com. إذا منحكنا لك الإذن بنشر أو إعادة إنتاج أو عرض أي جزء من خدماتنا أو محتوانا علنًا، فيجب عليك تحديدنا باعتبارنا المالكين أو المرخصين للخدمات أو المحتوى أو العلامات التجارية والتأكد من ظهور أي إشعار بحقوق الطبع والنشر أو الملكية أو رؤيته عند نشر أو إعادة إنتاج أو عرض محتوانا.</p>
<p>نحن نحتفظ بجميع الحقوق غير الممنوحة لك صراحةً فيما يتعلق بالخدمات والمحتوى والعلامات التجارية.</p>
<p>أي خرق لحقوق الملكية الفكرية هذه سيشكل خرقًا ماديًا لشروطنا القانونية وسينتهي حقك في استخدام خدماتنا على الفور.</p>
<p><strong>إرسالياتك</strong></p>
<p>يرجى مراجعة هذا القسم وقسم "الأنشطة المحظورة" بعناية قبل استخدام خدماتنا لفهم (أ) الحقوق التي تمنحها لنا و(ب) الالتزامات التي تقع على عاتقك عند نشر أو تحميل أي محتوى من خلال الخدمات.</p>
<p><strong>الإرساليات:</strong> بإرسال أي سؤال أو تعليق أو اقتراح أو فكرة أو ملاحظات أو معلومات أخرى إلينا مباشرةً حول الخدمات ("الإرساليات")، فإنك توافق على التنازل لنا عن جميع حقوق الملكية الفكرية في مثل هذه الإرساليات. أنت توافق على أننا</p>
<p>سنمتلك هذه الإرساليات ونحق في استخدامها ونشرها دون قيود لأي غرض قانوني، تجاري أو غير ذلك، دون إقرار أو تعويض لك.</p>
<p><strong>أنت مسؤول عن ما تنشره أو تحمّله:</strong> بإرسالك لنا المواد المقدمة عبر أي جزء من الخدمات، فإنك:</p>
<ul>
<li>تؤكد أنك قرأت ووافقت على "أنشطتنا المحظورة" ولن تنشر أو ترسل أو تحمّل أو تنقل عبر الخدمات أي مادة مقدمة غير قانونية أو مضايقة أو كراهية أو ضارة أو تشهيرية أو فاحشة أو متهورة أو مسيئة أو تمييزية أو تهديد لأي شخص أو مجموعة أو صريحة جنسيًا أو كاذبة أو غير دقيقة أو مخادعة أو مضللة؛</li>
<li>إلى الحد الذي يسمح به القانون المعمول به، تتنازل عن أي حقوق أخلاقية أو جميع الحقوق المتعلقة بأي مادة مقدمة من هذا القبيل؛</li>
<li>تضمن أن أي مادة مقدمة من هذا القبيل أصلية لك أو أن لديك الحقوق والتراخيص اللازمة لتقديم مثل هذه المواد المقدمة وأن لديك السلطة الكاملة لمنحنا الحقوق المذكورة أعلاه فيما يتعلق بموادك المقدمة؛</li>
<li>وتضمن وتقر بأن موادك المقدمة لا تشكل معلومات سرية.</li>
</ul>
<p>أنت المسؤول الوحيد عن إرسالياتك وتوافق صراحةً على تعويضنا عن أي خسائر قد نتكبدها بسبب انتهاكك (أ) لهذا القسم، أو (ب) حقوق الملكية الفكرية لأي طرف ثالث، أو (ج) القانون المعمول به.</p>
<ol start="3">
<li><strong> تصريحات المستخدم</strong></li>
</ol>
<p>باستخدام الخدمات، فإنك تقر وتضمن أن: (1) جميع معلومات التسجيل التي ترسلها ستكون صحيحة ودقيقة وحديثة وكاملة؛ (2) ستحافظ على دقة هذه المعلومات وتحديث معلومات التسجيل هذه على الفور حسب الضرورة؛ (3) لديك القدرة القانونية وتوافق على الامتثال لهذه الشروط القانونية؛ (4) لست أقل من 13 عامًا؛ (5) لست قاصرًا في الولاية القضائية التي تقيم فيها، أو إذا كنت قاصرًا، فقد حصلت على إذن من أحد الوالدين لاستخدام الخدمات؛ (6) لن تتمكن من الوصول إلى الخدمات من خلال وسائل آلية أو غير بشرية، سواء من خلال روبوت أو برنامج نصي أو غير ذلك؛ (7) لن تستخدم الخدمات لأي غرض غير قانوني أو غير مصرح به؛ (8) لن ينتهك استخدامك للخدمات أي قانون أو لائحة سارية.</p>
<p>إذا قدمت أي معلومات غير صحيحة أو غير دقيقة أو غير محدثة أو غير كاملة، يحق لنا تعليق حسابك أو إنهائه ورفض أي استخدام حالي أو مستقبلي للخدمات (أو أي جزء منها).</p>
<ol start="4">
<li><strong> تسجيل المستخدم</strong></li>
</ol>
<p>قد يُطلب منك التسجيل لاستخدام الخدمات. أنت توافق على الحفاظ على سرية كلمة مرورك وستكون مسؤولاً عن جميع استخدامات حسابك وكلمة مرورك. نحتفظ بالحق في إزالة أو استعادة أو تغيير اسم المستخدم الذي تختاره إذا قررنا، وفقًا لتقديرنا وحدنا، أن اسم المستخدم هذا غير مناسب أو فاحش أو غير مقبول.</p>
<ol start="5">
<li><strong> الأنشطة المحظورة</strong></li>
</ol>
<p>لا يجوز لك الوصول إلى الخدمات أو استخدامها لأي غرض آخر غير الغرض الذي نوفر الخدمات من أجله. لا يجوز استخدام الخدمات فيما يتعلق بأي مساعٍ تجارية باستثناء تلك التي نؤيدها أو نوافق عليها على وجه التحديد.</p>
<p>باعتبارك مستخدمًا للخدمات، فإنك توافق على عدم:</p>
<ul>
<li>استرداد البيانات أو أي محتوى آخر بشكل منهجي من الخدمات لإنشاء أو تجميع مجموعة أو مجموعة أو قاعدة بيانات أو دليل بشكل مباشر أو غير مباشر دون إذن كتابي منا.</li>
<li>خداعنا أو الاحتيال علينا أو على المستخدمين الآخرين أو تضليلهم، وخاصة في أي محاولة لمعرفة معلومات حساب حساسة مثل كلمات مرور المستخدم.</li>
<li>التحايل على ميزات الأمان في الخدمات أو تعطيلها أو التدخل فيها بأي شكل من الأشكال، بما في ذلك الميزات التي تمنع أو تقيد استخدام أو نسخ أي محتوى أو تفرض قيودًا على استخدام الخدمات و/أو المحتوى الموجود فيها.</li>
<li>تشويه سمعتنا أو تشويه سمعتنا أو إلحاق الضرر بنا و/أو بالخدمات، في رأينا.</li>
<li>استخدام أي معلومات تم الحصول عليها من الخدمات بهدف مضايقة أو إساءة معاملة أو إيذاء شخص آخر.</li>
</ul>
<p>&nbsp;</p>
<ul>
<li>الاستخدام غير اللائق لخدمات الدعم لدينا أو تقديم تقارير كاذبة عن إساءة المعاملة أو سوء السلوك.</li>
<li>استخدام الخدمات بطريقة تتعارض مع أي قوانين أو لوائح سارية.</li>
<li>المشاركة في تأطير أو ربط الخدمات بشكل غير مصرح به.</li>
<li>تحميل أو نقل (أو محاولة تحميل أو نقل) الفيروسات أو أحصنة طروادة أو غيرها من المواد، بما في ذلك الاستخدام المفرط للأحرف الكبيرة والبريد العشوائي (النشر المستمر للنص المتكرر)، الذي يتعارض مع الاستخدام المتواصل لأي طرف والاستمتاع بالخدمات أو تعديل أو إضعاف أو تعطيل أو تغيير أو التدخل في استخدام الخدمات أو ميزاتها أو وظائفها أو تشغيلها أو صيانتها.</li>
<li>الانخراط في أي استخدام آلي للنظام، مثل استخدام البرامج النصية لإرسال التعليقات أو الرسائل، أو استخدام أي أدوات لاستخراج البيانات أو الروبوتات أو أدوات جمع البيانات واستخراجها المماثلة.</li>
<li>حذف إشعار حقوق الطبع والنشر أو إشعار حقوق الملكية الأخرى من أي محتوى.</li>
<li>محاولة انتحال شخصية مستخدم أو شخص آخر أو استخدام اسم مستخدم مستخدم آخر.</li>
<li>تحميل أو إرسال (أو محاولة تحميل أو إرسال) أي مادة تعمل كآلية جمع أو نقل معلومات سلبية أو نشطة، بما في ذلك على سبيل المثال لا الحصر، تنسيقات تبادل الرسومات الواضحة ("gifs")، أو بكسل 1 &times; 1، أو أخطاء الويب، أو ملفات تعريف الارتباط، أو الأجهزة المماثلة الأخرى (يشار إليها أحيانًا باسم "برامج التجسس" أو "آليات التجميع السلبية" أو "pcms").</li>
<li>التدخل في الخدمات أو الشبكات أو الخدمات المتصلة بالخدمات أو تعطيلها أو خلق عبء غير مبرر عليها.</li>
<li>مضايقة أو إزعاج أو ترهيب أو تهديد أي من موظفينا أو وكلائنا المشاركين في تقديم أي جزء من الخدمات لك.</li>
<li>محاولة تجاوز أي تدابير للخدمات مصممة لمنع أو تقييد الوصول إلى الخدمات أو أي جزء من الخدمات.</li>
<li>نسخ أو تعديل برامج الخدمات، بما في ذلك على سبيل المثال لا الحصر Flash أو PHP أو HTML أو JavaScript أو أي كود آخر.</li>
<li>باستثناء ما يسمح به القانون المعمول به، فك شفرة أو تفكيك أو إجراء هندسة عكسية لأي من البرامج التي تتألف منها الخدمات أو تشكل جزءًا منها بأي شكل من الأشكال.</li>
<li>باستثناء ما قد يكون نتيجة لاستخدام محرك بحث قياسي أو متصفح إنترنت، أو استخدام أو تشغيل أو تطوير أو توزيع أي نظام آلي، بما في ذلك على سبيل المثال لا الحصر، أي عنكبوت أو روبوت أو أداة غش أو كاشط أو قارئ غير متصل بالإنترنت يمكنه الوصول إلى الخدمات، أو استخدام أو تشغيل أي نص برمجي غير مصرح به أو أي برنامج آخر.</li>
<li>استخدام وكيل شراء أو وكيل شراء لإجراء عمليات شراء على الخدمات.</li>
<li>لا يجوز لك استخدام الخدمات بشكل غير مصرح به، بما في ذلك جمع أسماء المستخدمين و/أو عناوين البريد الإلكتروني للمستخدمين عن طريق الوسائل الإلكترونية أو غيرها لغرض إرسال رسائل بريد إلكتروني غير مرغوب فيها، أو إنشاء حسابات مستخدمين بوسائل آلية أو تحت ذرائع كاذبة.</li>
<li>لا يجوز لك استخدام الخدمات كجزء من أي جهد للتنافس معنا أو استخدام الخدمات و/أو المحتوى بأي شكل آخر لأي مسعى مدر للدخل أو مشروع تجاري.</li>
<li>لا يجوز لك استخدام الخدمات للإعلان عن السلع والخدمات أو عرض بيعها.</li>
<li>لا يجوز لك بيع ملفك الشخصي أو نقله بأي شكل آخر.</li>
</ul>
<ol start="6">
<li><strong>6</strong><strong>. المساهمات التي ينشئها المستخدمون</strong></li>
</ol>
<p>لا تقدم الخدمات للمستخدمين إمكانية إرسال أو نشر المحتوى.</p>
<p>&nbsp;</p>
<ol start="7">
<li><strong>7</strong><strong>. ترخيص المساهمة</strong></li>
</ol>
<p>توافق أنت والخدمات على أنه يجوز لنا الوصول إلى أي معلومات وبيانات شخصية تقدمها وخياراتك (بما في ذلك الإعدادات) وتخزينها ومعالجتها واستخدامها.</p>
<p>من خلال إرسال الاقتراحات أو أي تعليقات أخرى بخصوص الخدمات، فإنك توافق على أنه يجوز لنا استخدام هذه التعليقات ومشاركتها لأي غرض دون تعويض لك.</p>
<ol start="8">
<li><strong>8</strong><strong>. ترخيص تطبيق الهاتف المحمول</strong></li>
</ol>
<p><strong>ترخيص الاستخدام</strong></p>
<p>إذا قمت بالوصول إلى الخدمات عبر التطبيق، فإننا نمنحك حقًا محدودًا قابلًا للإلغاء وغير حصري وغير قابل للتحويل لتثبيت التطبيق واستخدامه على الأجهزة الإلكترونية اللاسلكية المملوكة لك أو الخاضعة لسيطرتك، والوصول إلى التطبيق واستخدامه على هذه الأجهزة وفقًا للشروط والأحكام الخاصة بترخيص تطبيق الهاتف المحمول هذا المضمن في هذه الشروط القانونية. لا يجوز لك: (1) باستثناء ما يسمح به القانون المعمول به، فك تشفير التطبيق أو إعادة هندسته أو تفكيكه أو محاولة اشتقاق الكود المصدري منه أو فك تشفيره؛ (2) إجراء أي تعديل أو تكييف أو تحسين أو تعزيز أو ترجمة أو عمل مشتق من التطبيق؛ (3) انتهاك أي قوانين أو قواعد أو لوائح سارية فيما يتعلق بوصولك إلى التطبيق أو استخدامه؛ (4) إزالة أو تغيير أو حجب أي إشعار ملكية (بما في ذلك أي إشعار بحقوق الطبع والنشر أو العلامة التجارية) نشرناه نحن أو المرخصون للتطبيق؛ (5) استخدام التطبيق لأي مسعى مدر للدخل أو مشروع تجاري أو أي غرض آخر لم يتم تصميمه أو قصده من أجله؛ (6) جعل التطبيق متاحًا عبر شبكة أو بيئة أخرى تسمح بالوصول إليه أو استخدامه من قبل أجهزة أو مستخدمين متعددين في نفس الوقت؛ (7) استخدام التطبيق لإنشاء منتج أو خدمة أو برنامج يتنافس بشكل مباشر أو غير مباشر مع التطبيق أو يكون بديلاً له بأي شكل من الأشكال؛ (8) استخدام التطبيق لإرسال استعلامات آلية إلى أي موقع ويب أو لإرسال أي بريد إلكتروني تجاري غير مرغوب فيه؛ أو (9) استخدام أي معلومات ملكية أو أي من واجهاتنا أو ملكيتنا الفكرية الأخرى في تصميم أو تطوير أو تصنيع أو ترخيص أو توزيع أي تطبيقات أو ملحقات أو أجهزة لاستخدامها مع التطبيق.</p>
<p><strong>أجهزة </strong><strong>Apple</strong> <strong>و</strong><strong>Android</strong></p>
<p>تطبق الشروط التالية عند استخدامك للتطبيق الذي حصلت عليه من متجر Apple أو Google Play (يُطلق على كل منهما "موزع تطبيقات") للوصول إلى الخدمات: (1) يقتصر الترخيص الممنوح لك لتطبيقنا على ترخيص غير قابل للتحويل لاستخدام التطبيق على جهاز يستخدم أنظمة التشغيل Apple iOS أو Android، حسب الاقتضاء، ووفقًا لقواعد الاستخدام المنصوص عليها في شروط خدمة موزع التطبيقات المعمول به؛ (2) نحن مسؤولون عن أي ضرر قد يلحق بك نتيجة استخدامك للتطبيق. (3) في حالة فشل التطبيق في الامتثال لأي ضمان قابل للتطبيق، يجوز لك إخطار موزع التطبيق المعمول به، ويجوز لموزع التطبيق، وفقًا لشروطه وسياساته، استرداد سعر الشراء، إن وجد، المدفوع مقابل التطبيق، وإلى الحد الأقصى المسموح به بموجب القانون المعمول به، لن يكون لدى موزع التطبيق أي التزام آخر بالضمان على الإطلاق فيما يتعلق بالتطبيق؛ (4) أنت تقر وتضمن (أ) أنك لا تقع في بلد يخضع لحظر حكومي أمريكي، أو تم تصنيفه من قبل حكومة الولايات المتحدة كدولة "داعمة للإرهاب" و(ب) أنك غير مدرج في أي قائمة حكومية أمريكية للأطراف المحظورة أو المقيدة؛ (5) يجب عليك الامتثال لشروط اتفاقية الطرف الثالث المعمول بها عند استخدام التطبيق، على سبيل المثال، إذا كان لديك تطبيق VoIP، فيجب ألا تنتهك اتفاقية خدمة البيانات اللاسلكية الخاصة بهم عند استخدام التطبيق؛ و(6) أنت تقر وتوافق على أن موزعي التطبيق هم مستفيدون من أطراف ثالثة من الشروط والأحكام الواردة في ترخيص تطبيق الهاتف المحمول هذا والمضمنة في هذه الشروط القانونية، وأن كل موزع تطبيق سيكون له الحق (وسيُعتبر قد قبل الحق) في فرض الشروط والأحكام الواردة في ترخيص تطبيق الهاتف المحمول هذا والمضمنة في هذه الشروط القانونية ضدك باعتبارك مستفيدًا من طرف ثالث منها.</p>
<ol start="9">
<li><strong> وسائل التواصل الاجتماعي</strong></li>
</ol>
<p>كجزء من وظائف الخدمات، يمكنك ربط حسابك بالحسابات عبر الإنترنت التي لديك مع موفري خدمات تابعين لجهات خارجية (كل حساب من هذه الحسابات، "حساب تابع لجهة خارجية") إما عن طريق: (1) تقديم معلومات تسجيل الدخول إلى حساب الطرف الثالث الخاص بك من خلال الخدمات؛ أو (2) السماح لنا بالوصول إلى حسابك لدى جهة خارجية، كما هو مسموح به بموجب الشروط والأحكام المعمول بها والتي تحكم استخدامك لكل حساب لدى جهة خارجية. أنت تقر وتضمن أنك مخول بالكشف عن معلومات تسجيل الدخول إلى حسابك لدى جهة خارجية لنا و/أو منحنا حق الوصول إلى حسابك لدى جهة خارجية، دون انتهاك من جانبك لأي من الشروط والأحكام التي تحكم استخدامك لحساب الجهة الخارجية المعمول به، ودون إلزامنا بدفع أي رسوم أو إخضاعنا لأي قيود استخدام يفرضها مزود الخدمة التابع لجهة خارجية لحساب الجهة الخارجية. من خلال منحنا إمكانية الوصول إلى أي حسابات تابعة لجهات خارجية، فإنك تفهم أنه (1) يجوز لنا الوصول إلى أي محتوى قدمته إلى حسابك التابع لجهات خارجية (يُشار إليه باسم "محتوى الشبكة الاجتماعية") وإتاحته وتخزينه (إن أمكن) بحيث يكون متاحًا على الخدمات ومن خلالها عبر حسابك، بما في ذلك على سبيل المثال لا الحصر أي قوائم أصدقاء و(2) يجوز لنا إرسال معلومات إضافية إلى حسابك التابع لجهات خارجية وتلقيها منه إلى الحد الذي يتم إخطارك به عند ربط حسابك بحساب الجهة الخارجية. بناءً على حسابات الجهات الخارجية التي تختارها وخاضعًا لإعدادات الخصوصية التي قمت بتعيينها في حسابات الجهات الخارجية هذه، قد تكون المعلومات الشخصية التي تنشرها على حسابات الجهات الخارجية الخاصة بك متاحة على حسابك على الخدمات ومن خلاله. يرجى ملاحظة أنه إذا أصبح حساب الجهة الخارجية أو الخدمة المرتبطة به غير متاح أو تم إنهاء وصولنا إلى حساب الجهة الخارجية من قبل مزود الخدمة التابع لجهة خارجية، فقد لا يكون محتوى الشبكة الاجتماعية متاحًا على الخدمات ومن خلالها. سيكون لديك القدرة على تعطيل الاتصال بين حسابك على الخدمات وحساباتك لدى جهات خارجية في أي وقت. يرجى ملاحظة أن علاقتك بموفري الخدمات من جهات خارجية المرتبطين بحساباتك لدى جهات خارجية تحكمها فقط اتفاقياتك مع موفري الخدمات من جهات خارجية. لا نبذل أي جهد لمراجعة أي محتوى على الشبكات الاجتماعية لأي غرض، بما في ذلك على سبيل المثال لا الحصر، الدقة أو الشرعية أو عدم الانتهاك، ولا نتحمل مسؤولية أي محتوى على الشبكات الاجتماعية. أنت تقر وتوافق على أنه يجوز لنا الوصول إلى دفتر عناوين بريدك الإلكتروني المرتبط بحساب جهة خارجية وقائمة جهات الاتصال المخزنة على جهازك المحمول أو الكمبيوتر اللوحي فقط لأغراض تحديد وإبلاغك بجهات الاتصال التي سجلت أيضًا لاستخدام الخدمات. يمكنك إلغاء تنشيط الاتصال بين الخدمات وحساب الطرف الثالث الخاص بك عن طريق الاتصال بنا باستخدام معلومات الاتصال أدناه أو من خلال إعدادات حسابك (إن أمكن). سنحاول حذف أي معلومات مخزنة على خوادمنا تم الحصول عليها من خلال حساب الطرف الثالث هذا، باستثناء اسم المستخدم وصورة الملف الشخصي التي أصبحت مرتبطة بحسابك.</p>
<ol start="10">
<li><strong> مواقع الطرف الثالث والمحتوى</strong></li>
</ol>
<p>قد تحتوي الخدمات (أو قد يتم إرسالها إليك عبر التطبيق) &nbsp;lلا يجوز لك نشر أو تحميل أو إرسال أو تحميل أي محتوى أو مواد إلى مواقع ويب أخرى ("مواقع ويب تابعة لجهات خارجية") بالإضافة إلى المقالات والصور والنصوص والرسومات والصور والتصاميم والموسيقى والصوت والفيديو والمعلومات والتطبيقات والبرامج وغيرها من المحتويات أو العناصر التي تنتمي إلى جهات خارجية أو تنشأ منها ("محتوى الجهات الخارجية"). لا نقوم بالتحقيق في مواقع الويب التابعة لجهات خارجية ومحتوى الجهات الخارجية أو مراقبتها أو التحقق من دقتها أو ملاءمتها أو اكتمالها، ولا نتحمل المسؤولية عن أي مواقع ويب تابعة لجهات خارجية يمكن الوصول إليها من خلال الخدمات أو أي محتوى تابع لجهات خارجية منشور على الخدمات أو متاح من خلالها أو مثبت منها، بما في ذلك المحتوى أو الدقة أو الإساءة أو الآراء أو الموثوقية أو ممارسات الخصوصية أو السياسات الأخرى الخاصة بمواقع الويب التابعة لجهات خارجية أو محتوى الجهات الخارجية أو الواردة فيها. لا يعني تضمين أو ربط أو السماح باستخدام أو تثبيت أي مواقع ويب تابعة لجهات خارجية أو أي محتوى تابع لجهات خارجية موافقة أو تأييدًا من جانبنا. إذا قررت ترك الخدمات والوصول إلى مواقع الطرف الثالث أو استخدام أو تثبيت أي محتوى تابع لجهة خارجية، فإنك تفعل ذلك على مسؤوليتك الخاصة، ويجب أن تكون على علم بأن هذه الشروط القانونية لم تعد سارية. يجب عليك مراجعة الشروط والسياسات المعمول بها، بما في ذلك ممارسات الخصوصية وجمع البيانات، لأي موقع ويب تتصفحه من الخدمات أو المتعلقة بأي تطبيقات تستخدمها أو تثبتها من الخدمات. ستكون أي عمليات شراء تقوم بها من خلال مواقع الطرف الثالث من خلال مواقع ويب أخرى ومن شركات أخرى، ولا نتحمل أي مسؤولية على الإطلاق فيما يتعلق بهذه المشتريات التي تتم حصريًا بينك وبين الطرف الثالث المعني. أنت توافق وتقر بأننا لا نؤيد المنتجات أو الخدمات المقدمة على مواقع الطرف الثالث ويجب أن تعفينا من أي ضرر ناتج عن شرائك لهذه المنتجات أو الخدمات. بالإضافة إلى ذلك، يجب أن تعفينا من أي خسائر تتكبدها أو ضرر يلحق بك فيما يتعلق بأي محتوى تابع لجهة خارجية أو أي اتصال بمواقع الطرف الثالث أو ينتج عنه بأي شكل من الأشكال.</p>
<ol start="11">
<li><strong>11</strong><strong>. المعلنون</strong></li>
</ol>
<p>نسمح للمعلنين بعرض إعلاناتهم ومعلومات أخرى في مناطق معينة من الخدمات، مثل إعلانات الشريط الجانبي أو إعلانات اللافتات. نحن ببساطة نوفر المساحة لوضع مثل هذه الإعلانات، وليس لدينا أي علاقة أخرى مع المعلنين.</p>
<ol start="12">
<li><strong>12</strong><strong>. إدارة الخدمات</strong></li>
</ol>
<p>نحتفظ بالحق، ولكن ليس الالتزام، في: (1) مراقبة الخدمات بحثًا عن انتهاكات لهذه الشروط القانونية؛ (2) اتخاذ الإجراءات القانونية المناسبة ضد أي شخص ينتهك القانون أو هذه الشروط القانونية، وفقًا لتقديرنا وحدنا، بما في ذلك على سبيل المثال لا الحصر، الإبلاغ عن مثل هذا المستخدم إلى سلطات إنفاذ القانون؛ (3) وفقًا لتقديرنا وحدنا ودون قيود، رفض أو تقييد الوصول إلى أو الحد من توفر أو تعطيل (إلى الحد الذي تسمح به التكنولوجيا) أي من مساهماتك أو أي جزء منها؛ (4) وفقًا لتقديرنا وحدنا ودون قيود، إشعار أو مسؤولية، إزالة جميع الملفات والمحتوى من الخدمات أو تعطيلها بأي شكل آخر إذا كانت كبيرة الحجم أو تشكل عبئًا على أنظمتنا بأي شكل من الأشكال؛ و(5) خلاف ذلك إدارة الخدمات بطريقة مصممة لحماية حقوقنا وممتلكاتنا وتسهيل الأداء السليم للخدمات.</p>
<ol start="13">
<li><strong>13</strong><strong>. المدة والإنهاء</strong></li>
</ol>
<p>تظل هذه الشروط القانونية سارية المفعول بالكامل أثناء استخدامك للخدمات. دون تقييد أي حكم آخر من هذه الشروط القانونية، نحتفظ بالحق، وفقًا لتقديرنا وحدنا ودون إشعار أو مسؤولية، في رفض الوصول إلى الخدمات واستخدامها (بما في ذلك حظر بعض عناوين IP) لأي شخص لأي سبب أو بدون سبب، بما في ذلك دون حصر انتهاك أي تمثيل أو ضمان أو تعهد موجود في هذه الشروط القانونية أو أي قانون أو لائحة سارية. يجوز لنا إنهاء استخدامك أو مشاركتك في الخدمات أو حذف حسابك وأي محتوى أو معلومات نشرتها في أي وقت، دون سابق إنذار، وفقًا لتقديرنا وحدنا.</p>
<p>إذا أنهينا حسابك أو علقناه لأي سبب، يُحظر عليك تسجيل وإنشاء حساب جديد باسمك أو باسم مزيف أو مستعار أو باسم أي طرف ثالث، حتى لو كنت تتصرف نيابة عن الطرف الثالث. بالإضافة إلى إنهاء حسابك أو تعليقه، نحتفظ بالحق في اتخاذ الإجراءات القانونية المناسبة، بما في ذلك على سبيل المثال لا الحصر متابعة التعويض المدني والجنائي والاحتجازي.</p>
<ol start="14">
<li><strong>14</strong><strong>. التعديلات والانقطاعات</strong></li>
</ol>
<p>نحتفظ بالحق في تغيير أو تعديل أو إزالة محتويات الخدمات في أي وقت أو لأي سبب وفقًا لتقديرنا وحدنا دون إشعار. ومع ذلك، ليس لدينا أي التزام بتحديث أي معلومات حول خدماتنا. لن نتحمل المسؤولية أمامك أو أمام أي طرف ثالث عن أي تعديل أو تغيير في الأسعار أو تعليق أو إيقاف الخدمات.</p>
<p>لا يمكننا ضمان توفر الخدمات في جميع الأوقات. قد نواجه مشكلات في الأجهزة أو البرامج أو غيرها أو نحتاج إلى إجراء صيانة متعلقة بالخدمات، مما يؤدي إلى انقطاعات أو تأخيرات أو&nbsp; الأخطاء. نحتفظ بالحق في تغيير أو مراجعة أو تحديث أو تعليق أو إيقاف أو تعديل الخدمات بأي شكل آخر في أي وقت أو لأي سبب دون إشعارك. أنت توافق على أننا لا نتحمل أي مسؤولية على الإطلاق عن أي خسارة أو ضرر أو إزعاج ناتج عن عدم قدرتك على الوصول إلى الخدمات أو استخدامها أثناء أي توقف أو توقف للخدمات. لن يتم تفسير أي شيء في هذه الشروط القانونية على أنه يلزمنا بالحفاظ على الخدمات ودعمها أو تقديم أي تصحيحات أو تحديثات أو إصدارات فيما يتعلق بذلك.</p>
<ol start="15">
<li><strong>15</strong><strong>. القانون الحاكم</strong></li>
</ol>
<p>تخضع هذه الشروط القانونية لقوانين المملكة العربية السعودية وتُعرَّف وفقًا لها. توافق شركة MARDOD CO وأنت بشكل لا رجعة فيه على أن محاكم المملكة العربية السعودية لها الاختصاص الحصري لحل أي نزاع قد ينشأ فيما يتعلق بهذه الشروط القانونية.</p>
<ol start="16">
<li><strong>16</strong><strong>. حل النزاعات</strong></li>
</ol>
<p>أنت توافق على إحالة جميع النزاعات المتعلقة بهذه الشروط القانونية أو العلاقة القانونية التي أنشأتها هذه الشروط القانونية بشكل لا رجعة فيه إلى اختصاص محاكم المملكة العربية السعودية. تحتفظ شركة MARDOD CO أيضًا بالحق في رفع دعاوى بشأن جوهر الأمر في محاكم الدولة التي تقيم فيها أو، إذا تم إبرام هذه الشروط القانونية في سياق تجارتك أو مهنتك، في ولاية مكان عملك الرئيسي.</p>
<ol start="17">
<li><strong>17</strong><strong>. التصحيحات</strong></li>
</ol>
<p>قد تحتوي المعلومات الموجودة في الخدمات على أخطاء مطبعية أو عدم دقة أو سهو، بما في ذلك الأوصاف والأسعار والتوافر والعديد من المعلومات الأخرى. نحتفظ بالحق في تصحيح أي أخطاء أو عدم دقة أو سهو وتغيير أو تحديث المعلومات الموجودة في الخدمات في أي وقت، دون إشعار مسبق.</p>
<ol start="18">
<li><strong>18</strong><strong>. إخلاء المسؤولية</strong></li>
</ol>
<p>يتم توفير الخدمات على أساس "كما هي" و"كما تتوفر". أنت توافق على أن استخدامك للخدمات سيكون على مسؤوليتك وحدك. إلى أقصى حد يسمح به القانون، فإننا نتبرأ من جميع الضمانات، الصريحة أو الضمنية، فيما يتعلق بالخدمات واستخدامك لها، بما في ذلك، على سبيل المثال لا الحصر، الضمانات الضمنية لقابلية التسويق والملاءمة لغرض معين وعدم الانتهاك. لا نقدم أي ضمانات أو تعهدات بشأن دقة أو اكتمال محتوى الخدمات أو محتوى أي مواقع ويب أو تطبيقات جوال مرتبطة بالخدمات ولن نتحمل أي مسؤولية أو التزام عن أي (1) أخطاء أو هفوات أو عدم دقة في المحتوى والمواد، (2) إصابة شخصية أو ضرر بالممتلكات، من أي نوع كان، ناتج عن وصولك إلى الخدمات واستخدامك لها، (3) أي وصول غير مصرح به إلى خوادمنا الآمنة أو استخدامها و/أو أي وجميع المعلومات الشخصية و/أو المعلومات المالية المخزنة فيه، (4) أي انقطاع أو توقف للإرسال من أو إلى الخدمات، (5) أي أخطاء أو فيروسات أو أحصنة طروادة أو ما شابه ذلك والتي قد تنتقل إلى أو من خلال الخدمات من قبل أي طرف ثالث، و/أو (6) أي أخطاء أو سهو في أي محتوى ومواد أو عن أي خسارة أو ضرر من أي نوع يحدث نتيجة لاستخدام أي محتوى منشور أو منقول أو متاح بطريقة أخرى عبر الخدمات. نحن لا نضمن أو نؤيد أو نكفل أو نتحمل المسؤولية عن أي منتج أو خدمة معلن عنها أو معروضة من قبل طرف ثالث من خلال الخدمات، أو أي موقع ويب مرتبط، أو أي موقع ويب أو تطبيق جوال مميز في أي لافتة أو إعلان آخر، ولن نكون طرفًا أو مسؤولين بأي شكل من الأشكال عن مراقبة أي معاملة بينك وبين أي مقدمي خدمات أو منتجات من جهات خارجية. كما هو الحال مع شراء منتج أو خدمة من خلال أي وسيلة أو في أي بيئة، يجب عليك استخدام أفضل حكم لديك وممارسة الحذر عندما يكون ذلك مناسبًا.</p>
<ol start="19">
<li><strong>19</strong><strong>. حدود المسؤولية</strong></li>
</ol>
<p>في أي حال من الأحوال، لن نتحمل نحن أو مديرونا أو موظفونا أو وكلاؤنا أي مسؤولية تجاهك أو تجاه أي طرف ثالث عن أي أضرار مباشرة أو غير مباشرة أو تبعية أو نموذجية أو عرضية أو خاصة أو عقابية، بما في ذلك خسارة الأرباح أو خسارة الإيرادات أو فقدان البيانات أو أي أضرار أخرى ناجمة عن استخدامك للخدمات، حتى إذا تم إخطارنا باحتمالية حدوث مثل هذه الأضرار.</p>
<ol start="20">
<li><strong>20</strong><strong>. التعويض</strong></li>
</ol>
<p>أنت توافق على الدفاع عنا وتعويضنا وإبراء ذمتنا، بما في ذلك الشركات التابعة لنا والشركات التابعة لنا وجميع مسؤولينا ووكلائنا وشركائنا وموظفينا، من أي خسارة أو ضرر أو مسؤولية أو مطالبة أو طلب، بما في ذلك أتعاب ومصاريف المحاماة المعقولة، التي يقدمها أي طرف ثالث بسبب أو ناشئ عن: (1) استخدام الخدمات؛ (2) خرق هذه الشروط القانونية؛ (3) أي خرق لتصريحاتك وضماناتك المنصوص عليها في هذه الشروط القانونية؛ (4) انتهاكك لحقوق طرف ثالث، بما في ذلك على سبيل المثال لا الحصر حقوق الملكية الفكرية؛ أو (5) أي فعل ضار صريح تجاه أي مستخدم آخر للخدمات اتصلت به عبر الخدمات. وعلى الرغم مما سبق، فإننا نحتفظ بالحق، على نفقتك، في تولي الدفاع والسيطرة الحصرية على أي مسألة يُطلب منك تعويضنا عنها، وتوافق على التعاون، على نفقتك، مع دفاعنا عن مثل هذه المطالبات. وسوف نستخدم بذل جهود معقولة لإخطارك بأي مطالبة أو إجراء أو دعوى تخضع لهذا التعويض عند علمك بذلك.</p>
<ol start="21">
<li><strong> بيانات المستخدم</strong></li>
</ol>
<p>سنحتفظ ببعض البيانات التي ترسلها إلى الخدمات لغرض إدارة أداء الخدمات، بالإضافة إلى البيانات المتعلقة باستخدامك للخدمات. وعلى الرغم من أننا نجري عمليات نسخ احتياطية روتينية منتظمة للبيانات، فإنك وحدك المسؤول عن جميع البيانات التي ترسلها أو المتعلقة بأي نشاط قمت به باستخدام الخدمات. أنت توافق على أننا لن نتحمل أي مسؤولية تجاهك عن أي فقدان أو تلف لأي من هذه البيانات، وتتنازل بموجب هذا عن أي حق في اتخاذ إجراء ضدنا ينشأ عن أي فقدان أو تلف لهذه البيانات.</p>
<ol start="22">
<li><strong> الاتصالات الإلكترونية والمعاملات والتوقيعات</strong></li>
</ol>
<p>إن زيارة الخدمات وإرسال رسائل البريد الإلكتروني إلينا واستكمال النماذج عبر الإنترنت تشكل اتصالات إلكترونية. أنت توافق على تلقي الاتصالات الإلكترونية، وتوافق على أن جميع الاتفاقيات والإشعارات والإفصاحات والاتصالات الأخرى التي نقدمها لك إلكترونيًا، عبر البريد الإلكتروني وعلى الخدمات، تلبي أي متطلب قانوني يقتضي أن تكون هذه الاتصالات مكتوبة. أنت توافق بموجب هذا على استخدام التوقيعات الإلكترونية والعقود والأوامر والسجلات الأخرى، وعلى التسليم الإلكتروني للإشعارات والسياسات وسجلات المعاملات التي بدأناها أو أكملناها أو عبر الخدمات. أنت تتنازل بموجب هذا عن أي حقوق أو متطلبات بموجب أي قوانين أو لوائح أو قواعد أو مراسيم أو قوانين أخرى في أي ولاية قضائية تتطلب توقيعًا أصليًا أو تسليمًا أو الاحتفاظ بسجلات غير إلكترونية، أو المدفوعات أو منح الاعتمادات بأي وسيلة أخرى غير الوسائل الإلكترونية.</p>
<ol start="23">
<li><strong> أحكام عامة</strong></li>
</ol>
<p>تشكل هذه الشروط القانونية وأي سياسات أو قواعد تشغيل ننشرها على الخدمات أو فيما يتعلق بالخدمات الاتفاقية الكاملة والتفاهم بينك وبيننا. إن فشلنا في ممارسة أو فرض أي حق أو حكم من هذه الشروط القانونية لا يشكل تنازلاً عن هذا الحق أو الحكم. تعمل هذه الشروط القانونية إلى أقصى حد يسمح به القانون. يجوز لنا التنازل عن أي أو كل حقوقنا والتزاماتنا للآخرين في أي وقت. لن نكون مسؤولين عن أي خسارة أو ضرر أو تأخير أو فشل في التصرف ناتج عن أي سبب خارج عن سيطرتنا المعقولة. إذا تم تحديد أي حكم أو جزء من حكم من هذه الشروط القانونية على أنه غير قانوني أو باطل أو غير قابل للتنفيذ، فإن هذا الحكم أو الجزء من الحكم يعتبر منفصلاً عن هذه الشروط القانونية ولا يؤثر على صحة وقابلية تنفيذ أي أحكام متبقية. لا توجد علاقة مشروع مشترك أو شراكة أو توظيف أو وكالة بينك وبيننا نتيجة لهذه الشروط القانونية أو استخدام الخدمات. أنت توافق على عدم تفسير هذه الشروط القانونية ضدنا بحكم قيامنا بصياغتها. أنت تتنازل بموجب هذا عن أي وجميع الدفوع التي قد تكون لديك بناءً على النموذج الإلكتروني لهذه الشروط القانونية وعدم توقيع الأطراف المشاركة هنا لتنفيذ هذه الشروط القانونية.</p>
<ol start="24">
<li><strong> الاتصال بنا</strong></li>
</ol>
<p>لحل شكوى تتعلق بالخدمات أو لتلقي مزيد من المعلومات حول استخدام الخدمات، يرجى الاتصال بنا على:</p>
<p>mardodksa@gmail.com</p>
  """;
}
