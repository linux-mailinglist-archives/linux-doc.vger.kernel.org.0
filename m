Return-Path: <linux-doc+bounces-2848-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09C7F40BE
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 10:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4E55281018
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427BF1CF86;
	Wed, 22 Nov 2023 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gQExvp+6"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A929E;
	Wed, 22 Nov 2023 01:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wn/9vzG6JAi9RPOzdfWQqVcpa2+vbT0Xqvkj3yS2A/UvCk3g+k4/B0b0UlQOGzDRl6PpPra1JP81f00V5EBhzx9FObfv0/lDaTAYLm3RCVMwJis107zgMAKGVFrdWFUBZsgHWsMRV9GdOllFTYkDX0NswZM/+A3pszWJPrz6gJYS9ai9UbZsziNZyI/b2F4Hop/rCVzFtRa3BjVZJ6G2BzwKbNhWeVxuZSgVBrUy9QHhZl42BA7kyhy1ge7JHuXEJDEaozSXjVgGoJ/hjInTp2v5sJOfhkmTOOlJgPi7MjO0PaVgqvxaIA/w8Rj/5DPiLcsvvBlVbug8yAi+LbbWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM+KfM7X+cqn771BE52v+QvJ9nBQ1bu9YT+NL4CvWck=;
 b=Hw1RkBUFiknDWmOIrBfyNZUCGcMGNuVlOlJ2NE/7B5LH3iH69FTvnEAd9RAFmoW+2rTRFmVoUFtKlZPUnSr+7z3Gvp9TglXNaqCI7WkTgnv4XbqMDcKLDgUVueDGHlZsIgsvL48Maepimi6St7aHMMUrYeVFbKrri1EVrNZys18dBZn3qfZREGkx2J3VEmr64J8LB+ljy2gqB0JjiKUuBdbgYJ4+prRT+0yiJyLttfH5y46A0iSF8R3JlX2eQ1mpFWa9VJNnDxZVA6meDesHunlm0fMPGOeE5lLqHQ8JF3IO/z5aGwntHh0f10S37tv9hcY9KMrGXET/lPAymUiEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM+KfM7X+cqn771BE52v+QvJ9nBQ1bu9YT+NL4CvWck=;
 b=gQExvp+6WdgI7Cc7WkgLWbjWCG/ALqLrdlJjRAw46uOKaWRpXar3VMsIA4VnBMUrynXPFCub6VT/qxQTYNvthb3VJ92jGbR7bh6H/yTygPGIMvrQk4w2wdWMNOMe5A619aksDRnQSOXdMgNKdyEZgaJPdWPpb7k+wAVoNCSNx9w=
Received: from BL0PR01CA0029.prod.exchangelabs.com (2603:10b6:208:71::42) by
 BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 09:00:17 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:71:cafe::54) by BL0PR01CA0029.outlook.office365.com
 (2603:10b6:208:71::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Wed, 22 Nov 2023 09:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 09:00:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 03:00:04 -0600
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB05.amd.com
 (10.181.40.146) with ShadowRedundancy id 15.1.2507.6; Wed, 22 Nov 2023
 08:59:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 18:33:54 -0600
From: Avadhut Naik <avadhut.naik@amd.com>
To: <corbet@lwn.net>
CC: <linux-doc@vger.kernel.org>, <carlos.bilbao@amd.com>,
	<linux-kernel@vger.kernel.org>, <avadnaik@amd.com>
Subject: [PATCH] docs/sp_SP: Add translation of process/management-style
Date: Tue, 21 Nov 2023 18:33:43 -0600
Message-ID: <20231122003343.931394-1-avadhut.naik@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 5925342c-a34a-4db8-d31e-08dbeb397278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3vgp3bEsI9eSlXzLms2u7XiX/R0xHe1VBGXwoP/qabu0rlmk4s6ZKsvVXgViHSKjZ7rEMhzLOCdY7hrTMbjezOyc8QlWJ7WLAxNP1k+oOgSbk+DB2fvxj+NDzfL5RuiRjhhsDYrqj/b1hCGarAFy1gdyrgAUIwN/CS09uv1T7OAJDJXmfmlHPksqkQk2AKMAxvdRvOpDrJEIjl09KvjT3p/ZG6q4fG2ghFldja9K0TB5vXL/0B+zXUDnrmsGG6bbovLn17HbFkGDXBcVKn/CFGQgygggRYets5Uhrbga3+SjqEj/rkd511JXe+HTlxD8hEFJj6n/hPE2qqHujU/5sSwKV9oZVBzNd/eBcN4UA+TBm/WCKt+kYRWorNbaps/XumGr8QO31OU3fFvALu0xG3/IuDNe7bhUQCdj4GeuOJPplRXR7HQBafmUa+7BjacQw4V42t1F0WrfYoU5b9JbCBF0nxCcwDZlUpQlUX5JyCMlxE+G0HiTW82s57MEL/ErGC2s1O8JlCkXvIm5GZIl2ItsS4IW8HYPOkGNnvvZU6/2OPXAbKBO3/yWahtaS3NNPL8GbrFPX6evQoKyz7NgGqnVrtIY64d6us6FreIIul//jKvqFcM8w+nUmNjtL+Dirx47eh9S88vGOzwQeKktqDhTpXXD2Gn3Y0wyZHnfH35LNhwm+EdegusiFYZy5DzAH/LKX8LTv6IjV5g+qnz7sUT4B6Jo1djfAjJIYHGqRX5AkZ5fBgNO6cJ1g5eMtjVkqTmcIiG6afUHmG7uwU6jxAwvqPUpriPen6cfaf6i9tapOWV/dp3pscf6NJgyATvd+zpmhR6aX27S3socc+YN6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:es;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(230473577357003)(230373577357003)(82310400011)(1800799012)(451199024)(186009)(64100799003)(40470700004)(46966006)(36840700001)(478600001)(40460700003)(2616005)(1076003)(426003)(336012)(26005)(83380400001)(66574015)(81166007)(356005)(86362001)(82740400003)(36860700001)(47076005)(36756003)(6666004)(7696005)(2906002)(4326008)(5660300002)(30864003)(40480700001)(41300700001)(316002)(70206006)(70586007)(54906003)(6916009)(44832011)(8676002)(8936002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:00:16.8772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5925342c-a34a-4db8-d31e-08dbeb397278
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594

Translate Documentation/process/management-style.rst into Spanish.

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
 .../translations/sp_SP/process/index.rst      |   1 +
 .../sp_SP/process/management-style.rst        | 299 ++++++++++++++++++
 2 files changed, 300 insertions(+)
 create mode 100644 Documentation/translations/sp_SP/process/management-style.rst

diff --git a/Documentation/translations/sp_SP/process/index.rst b/Documentation/translations/sp_SP/process/index.rst
index a082e162168a..2c6eda05ba7a 100644
--- a/Documentation/translations/sp_SP/process/index.rst
+++ b/Documentation/translations/sp_SP/process/index.rst
@@ -25,3 +25,4 @@
    security-bugs
    embargoed-hardware-issues
    handling-regressions
+   management-style
diff --git a/Documentation/translations/sp_SP/process/management-style.rst b/Documentation/translations/sp_SP/process/management-style.rst
new file mode 100644
index 000000000000..4db33fbf8941
--- /dev/null
+++ b/Documentation/translations/sp_SP/process/management-style.rst
@@ -0,0 +1,299 @@
+.. include:: ../disclaimer-sp.rst
+
+:Original: Documentation/process/management-style.rst
+:Translator: Avadhut Naik <avadhut.naik@amd.com>
+
+.. _sp_managementstyle:
+
+
+Estilo de gestión del kernel de Linux
+=====================================
+
+Este es un documento breve que describe el estilo de gestión preferido (o
+inventado, dependiendo de a quién le preguntes) para el kernel de Linux.
+Está destinado a reflejar el documento
+:ref:`translations/sp_SP/process/coding-style.rst <sp_codingstyle>` hasta
+cierto punto y está escrito principalmente para evitar responder a [#f1]_
+las mismas preguntas (o similares) una y otra vez.
+
+El estilo de gestión es muy personal y mucho más difícil de cuantificar
+que reglas simples de estilo de codificación, por lo que este documento
+puede o no tener relación con la realidad. Comenzó como una broma, pero
+eso no significa que no pueda ser realmente cierto. Tendrás que decidir
+por ti mismo.
+
+Por cierto, cuando se hable de “gerente de kernel”, se refiere a las
+personas lideres técnicas, no de las personas que hacen la gestión
+tradicional dentro de las empresas. Si firmas pedidos de compra o tienes
+alguna idea sobre el presupuesto de tu grupo, es casi seguro que no eres
+un gerente de kernel. Estas sugerencias pueden o no aplicarse a usted.
+
+En primer lugar, sugeriría comprar “Seven Habits of Highly Effective
+People” y NO leerlo. Quemarlo, es un gran gesto simbólico.
+
+.. [#f1] Este documento lo hace no tanto respondiendo a la pregunta, sino
+  haciendo dolorosamente obvio para el interrogador que no tenemos ni idea
+  de cuál es la respuesta.
+
+De todos modos, aquí va:
+
+.. _decisiones:
+
+1) Decisiones
+-------------
+
+Todos piensan que los gerentes toman decisiones, y que la toma de
+decisiones en importante. Cuanto más grande y dolorosa sea la decisión,
+más grande debe ser el gerente para tomarla. Eso es muy profundo y obvio,
+pero en realidad no es cierto.
+
+El nombre del partido es **evitar** tener que tomar una decisión. En
+particular, si alguien te dice “elige (a) o (b), realmente necesitamos
+que decidas sobre esto”, estas en problemas como gerente. Es mejor que
+las personas a las que diriges conozcan los detalles mejor que tú, así
+que, si acuden a ti para tomar una decisión técnica, estas jodido.
+Claramente no eres competente para tomar una decisión por ellos.
+
+(Corolario: Si las personas a las que diriges no conocen los detalles
+mejor que tú, también estas jodido, aunque por una razón totalmente
+diferente. Es decir, que estas en el trabajo equivocado y que **ellos**
+deberían gestionando tu brillantez en su lugar).
+
+Así que el nombre del partido es **evitar** las decisiones, al menos las
+grandes y dolorosas. Tomar decisiones pequeñas y sin consecuencias está
+bien, y te hace parecer que sabes lo que estás haciendo, así que lo que
+un gerente de kernel necesita hacer es convertir las decisiones grandes
+y dolorosas en cosas pequeñas a los que a nadie realmente le importa.
+
+Ayuda darse cuenta de que la diferencia clave entre una decisión grande
+y una pequeña es si puede arreglar su decisión después. Cualquier
+decisión se puede hacer pequeña simplemente asegurándose siempre de que
+si te equivocaste (u **estarás** equivocado), siempre puede deshacer el
+daño más tarde retrocediendo. De repente, llegas a ser doblemente
+gerencial por tomar **dos** decisiones intrascendentes - la equivocada
+**y** la correcta.
+
+Y las personas incluso verán eso como un verdadero liderazgo (*tos*
+mierda *tos*).
+
+Por lo tanto, la llave para evitar las grandes decisiones se convierte en
+simplemente evitar hacer cosas que no se pueden deshacer. No te dejes
+llevar a una esquina del que no puedas escapar. Una rata acorralada puede
+ser peligrosa – un gerente acorralado es directamente lamentable.
+
+Resulta que, dado que nadie sería tan estúpido como para dejar que un
+gerente de kernel tenga una gran responsabilidad **de todos modos**,
+generalmente es bastante fácil retroceder. Dado que no vas a poder
+malgastar grandes cantidades de dinero que tal vez no puedas pagar, lo
+único que puedes revertir es una decisión técnica, y ahí retroceder es
+muy fácil: simplemente diles a todos que fuiste un bobo incompetente,
+pide disculpas y deshaz todo el trabajo inútil que hiciste trabajar a la
+gente durante el año pasado. De repente, la decisión que tomaste hace un
+año no era una gran decisión después de todo, ya que se podía deshacer
+fácilmente.
+
+Resulta que algunas personas tienen problemas con este enfoque, por dos
+razones:
+
+ - admitir que eras un idiota es más difícil de lo que parece. A todos
+   nos gusta mantener las apariencias, y salir en público a decir que te
+   equivocaste a veces es muy duro.
+ - que alguien te diga que lo que trabajaste durante el último año no
+   valió la pena después de todo también puede ser duro para los pobres
+   ingenieros humildes, y aunque el **trabajo** real fue bastante fácil
+   de deshacer simplemente eliminándolo, es posible que hayas perdido
+   irrevocablemente la confianza de ese ingeniero. Y recuerda:
+   “irrevocablemente” fue lo que tratamos de evitar en primer lugar, y
+   tu decisión terminó siendo muy grande después de todo.
+
+Afortunadamente, estas dos razones pueden mitigarse eficazmente
+simplemente admitiendo inicialmente que no tienes ni idea, y diciéndole
+a la gente que tu decisión es puramente preliminar, y podría ser la cosa
+equivocada. Siempre te debes reservar el derecho de cambiar de opinión, y
+hacer que la gente sea muy **consciente** de eso. Y es mucho más fácil
+admitir que eres estúpido cuando **aun** no has hecho la cosa realmente
+estúpida.
+
+Entonces, cuando realmente resulta ser estúpido, la gente simplemente
+pone los ojos y dice “Ups, otra vez no”.
+
+Esta admisión preventiva de incompetencia también podría hacer que las
+personas que realmente hacen el trabajo piensen dos veces sobre si vale la
+pena hacerlo o no. Después de todo, si **ellos** no están seguros de si es
+una buena idea, seguro que no deberías alentarlos prometiéndoles que lo
+que trabajan será incluido. Haz que al menos lo piensen dos veces antes de
+embarcarse en un gran esfuerzo.
+
+Recuerda: Es mejor que sepan más sobre los detalles que tú, y
+generalmente ya piensan que tienen la respuesta a todo. Lo mejor que puede
+hacer como gerente no es inculcar confianza, sino más bien una dosis
+saludable de pensamiento crítico sobre lo que hacen.
+
+Por cierto, otra forma de evitar una decisión es quejarse lastimeramente
+de “no podemos hacer ambas cosas?” y parecer lamentable. Créeme, funciona.
+Si no está claro cuál enfoque es mejor, lo descubrirán. La respuesta puede
+terminar siendo que ambos equipos se sientan tan frustrados por la
+situación que simplemente se den por vencidos.
+
+Eso puede sonar como un fracaso, pero generalmente es una señal de que
+había algo mal con ambos proyectos, y la razón por la que las personas
+involucradas no pudieron decidir fue que ambos estaban equivocados.
+Terminas oliendo a rosas y evitaste otra decisión que podrías haber
+metido la pata.
+
+2) Gente
+--------
+
+La mayoría de las personas son idiotas, y ser gerente significa que
+tendrás que lidiar con eso, y quizás lo más importante, que **ellos**
+tienen que lidiar **contigo**.
+
+Resulta que, si bien es fácil deshacer los errores técnicos, no es tan
+fácil deshacer los trastornos de personalidad. Solo tienes que vivir
+con los suyos - y el tuyo.
+
+Sin embargo, para prepararse como gerente del kernel, es mejor recordar
+no quemar ningún puente, bombardear a ningún aldeano inocente o alienar
+a demasiados desarrolladores del kernel. Resulta que alienar a las
+personas es bastante fácil, y desalienarlas es difícil. Por lo tanto,
+“alienar” cae inmediatamente debajo del título “no reversible”, y se
+convierte en un no-no según :ref:`decisiones`.
+
+Aquí solo hay algunas reglas simples:
+
+ (1) No llames a la gente pen*ejos (al menos no en público)
+ (2) Aprende a disculparte cuando olvidaste la regla (1)
+
+El problema con #1 es que es muy fácil de hacer, ya que puedes decir
+“eres un pen*ejo” de millones de manera diferentes [#f2]_, a veces sin
+siquiera darte cuenta, y casi siempre con una convicción ardiente de que
+tienes razón.
+
+Y cuanto más convencido estés de que tienes razón (y seamos sinceros,
+puedes llamar a casi **cualquiera** un pen*ejo, y a menudo **tendrás**
+razón), más difícil termina siendo disculparse después.
+
+Para resolver este problema, realmente solo tienes dos opciones:
+
+ - Se muy buenos en las disculpas.
+ - Difunde el “amor” de manera tan uniforme que nadie termina sintiendo
+   que es atacado injustamente. Hazlo lo suficientemente ingenioso, e
+   incluso podría divertirse.
+
+La opción de ser infaliblemente educado realmente no existe. Nadie
+confiará en alguien que está ocultando tan claramente su verdadero
+carácter.
+
+.. [#f2] Paul Simon cantó “Cincuenta maneras de dejar a tu amante” porque,
+  francamente, “Un millón de maneras de decirle a un desarrollador que es
+  un pen*ejo” no escanea tan bien. Pero estoy seguro de que lo pensó.
+
+3) Gente II – el Buen Tipo
+--------------------------
+
+Aunque resulta que la mayoría de las personas son idiotas, el corolario
+de eso es, tristemente, que tú también seas uno, y aunque todos podemos
+disfrutar del conocimiento seguro de que somos mejores que la persona
+promedio (somos realistas, nadie cree que nunca que son promedio o debajo
+del promedio), también debemos admitir que no somos el cuchillo más
+afilado alrededor, y habrá otras personas que son menos idiotas que tú.
+
+Algunas personas reaccionan mal a las personas inteligentes. Otras se
+aprovechan de ellos.
+
+Asegúrate de que tú, como mantenedor del kernel, estás en el segundo
+grupo. Aguanta con ellos, porque son las personas que te facilitarán el
+trabajo. En particular, podrán tomar tus decisiones por ti, que es de lo
+que se trata el juego.
+
+Así que cuando encuentras a alguien más inteligente que tú, simplemente
+sigue adelante. Sus responsabilidades de gestión se convierten en gran
+medida en las de decir “Suena como una buena idea, - hazlo sin
+restricciones”, o “Eso suena bien, pero ¿qué pasa con xxx?". La segunda
+versión en particular es una excelente manera de aprender algo nuevo
+sobre “xxx” o parecer **extra** gerencial al señalar algo que la persona
+más inteligente no había pensado. En cualquier caso, sales ganando.
+
+Una cosa para tener en cuenta es darse cuenta de que la grandeza en un
+área no necesariamente se traduce en otras áreas. Así que puedes impulsar
+a la gente en direcciones específicas, pero seamos realistas, pueden ser
+buenos en lo que hacen, y ser malos en todo lo demás. La buena noticia es
+que las personas tienden a gravitar naturalmente hacia lo que son buenos,
+por lo que no es como si estuvieras haciendo algo irreversible cuando los
+impulsas en alguna dirección, simplemente no presiones demasiado.
+
+4) Colocar la culpa
+-------------------
+
+Las cosas saldrán mal, y la gente quiere culpar a alguien. Etiqueta, tú
+lo eres.
+
+En realidad, no es tan difícil aceptar la culpa, especialmente si la gente
+se da cuenta de que no fue **toda** tu culpa. Lo que nos lleva a la mejor
+manera de asumir la culpa: hacerlo por otra persona. Te sentirás bien por
+asumir la caída, ellos se sentirán bien por no ser culpados, y la persona
+que perdió toda su colección de pornografía de 36 GB debido a tu
+incompetencia admitirá a regañadientes que al menos intentaste escapar
+de ella.
+
+Luego haz que el desarrollador que realmente metió la pata (si puedes
+encontrarlo) sepa **en privado** que metió la pata. No solo para que
+pueda evitarlo en futuro, sino para que sepan que te deben uno. Y, quizás
+aún más importante, también es probable que sea la persona que puede
+solucionarlo. Porque, seamos sinceros, seguro que no eres tú.
+
+Asumir la culpa también es la razón por la que llegas a ser un gerente
+en primer lugar. Es parte de lo que hace que la gente confíe en ti y te
+permita la gloria potencial porque eres tú quien puede decir “metí la
+pata”. Y si has seguido las reglas anteriores, ya serás bastante bueno
+para decir eso.
+
+5) Cosas que evitar
+-------------------
+
+Hay una cosa que la gente odia incluso más que ser llamado “pen*ejo”,
+y que es ser llamado “pen*ejo” en una voz mojigata. Por lo primero,
+puedes disculparte, por lo segundo, realmente, no tendrás la oportunidad.
+Es probable que ya no estén escuchando, incluso si de lo contrario haces
+un buen trabajo.
+
+Todos pensamos que somos mejores que los demás, lo que significa que
+cuando alguien más se da aires, **realmente** nos molesta. Puedes ser
+moral e intelectualmente superior a todos los que te rodean, pero no
+trates de hacerlo demasiado obvio a menos que tengas **la intención**
+real de irritar a alguien [#f3]_.
+
+Del mismo modo, no seas demasiado educado o sutil acerca de las cosas. La
+cortesía fácilmente termina yendo demasiado lejos y ocultado el problema,
+y como dicen “En internet, nadie puede oírte ser sutil”. Usa un gran
+objeto contundente para enfatizar el punto, porque realmente no puedes
+depender de que las personas entiendan tu punto de otra manera.
+
+Un poco de humor puede ayudar a suavizar tanto la franqueza como la
+moralización. Exagerar hasta el punto de ser ridículo puede reforzar un
+punto sin hacer que sea doloroso para el destinatario, quien simplemente
+piensa que estas siendo tonto. Por lo tanto, puede ayudarnos a superar el
+bloqueo mental personal que todos tenemos sobre la crítica.
+
+.. [#f3] La pista: Los grupos de noticias de Internet que no están
+  directamente relacionados con tu trabajo son excelentes maneras de
+  desahogar tus frustraciones con otras personas. Escribe mensajes
+  insultantes con una mueca de desprecio solo para entrar en un humor de
+  vez en cuando, y te sentirás limpio. Eso sí, no te cagues demasiado
+  cerca de casa.
+
+6) ¿Por qué a mí?
+-----------------
+
+Dado que tu principal responsabilidad parece ser asumir la culpa de los
+errores de otras personas y hacer dolorosamente obvio para todos los
+demás que eres incompetente, la pregunta obvia es: ¿por qué hacerlo en
+primer lugar?
+
+Pase lo que pase, **tendrás** una sensación inmensa de logro personal por
+estar “a cargo”. No importa el hecho de que realmente estés liderando al
+tratar de mantenerte al día con todos los demás y correr detrás de ellos
+lo más rápido que puedes. Todo el mundo seguirá pensando que eres la
+persona a cargo.
+
+Es un gran trabajo si puedes descifrarlo.
-- 
2.34.1


