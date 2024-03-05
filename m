Return-Path: <linux-doc+bounces-11507-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599B872A1B
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 23:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFEFBB20E54
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 22:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345A512D202;
	Tue,  5 Mar 2024 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wQRsmo+z"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2F12DDBF;
	Tue,  5 Mar 2024 22:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709677177; cv=fail; b=eJFz0D6ntHqfoDopD0pNR8+53gRroX7ERcJecJnL5vZoymgLuICzjs+1dcvn93nPWYYoZ6m5h5Wj5i7xTviypN1EelIS2P0AGOXoNAiqfgQL937bpwVpdKfU/+DvLKkshmktfb7CF0pndfzEWHlRsVckZjwR/uzp4cFHfwHY0pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709677177; c=relaxed/simple;
	bh=LhrufpR/yZM0v9fylAyS0qOMYqCkgRfP0kbofegZSqA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fnq5WO7zdP6kPQNJopXXpljisBSKjoohQe+V7BD3Z4fmf8oPNswQRBy840KfmpfXlLlKofgPxPD+dLT+j/kGTmwb6mjWBsv4aDPAhODxagVaJbMBH3O8vMy5C7DxbiyqiYmhCWjRYoBvZ3YnJxsLb6bX4FwA4iF9r5VXjMAA6MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wQRsmo+z; arc=fail smtp.client-ip=40.107.243.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNlkWzWadyBCunpoS35IN+uBj1X8Y9QoTEP9DqTCXrXOvWvRvtsfC6N5Uk8fPBWSjBoLCwQlc1DvydIBfG4+SAHF3blAMQrrqE4wBvGhD3PFzDuOQ7WdP4AmR5Zq46CwAi3bOfC0nMw7GA/LX8tK5P3Y9sEIK4w0BG66w14XP/d3aTCMgWWvkrmErTI9g+IyrSGVnubNAT7xrxwx0WegpO3+gUpCGJ+V5GhBTrA4XIfLDSj0qDb3rhDN0sWq5Fty7u4ywR+C8ZkEZpV5/bdJMzeKhCvEtjwgs/hqil7Vefn1QbkRfwzznbhSlATCM6/qpgcnuSAFoKqoDibNOInqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDtO+SUJBnJFqyZz2FK7IyT9Pb+9/gborxjjkDRcGe0=;
 b=S4YksvU6ihKYoInPIBPrj9ygpYtktMGNnKoGnvvLFLZnx7wy/v45gLO/E2ek5DHFmcFpzpGh/nlAivXW+veN2KCSIHrP4WrPKCxbnrU5rYm5Sj5F7yxgEB2eMKgViuCyoNW22mdcXtD6nsKRQ7dLIb/f8DnUWGCWwMgbFwhqbNA2DsUZfXDVFxOoq9T0MofCEBK6+YzhrqTZtmqiMbMv8Du/qHOXFrgfPY9P9Dnhwf38fZDi7tC3Q6um52nU/ESs22fDD3dbiNxd7RiQUXUZNqb+1sR35Gz6bLitx+cn9Z2mfjtZ+r1Ia/jMvog+bK8kQNJJ/VCZsdV4lpTJu7CnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDtO+SUJBnJFqyZz2FK7IyT9Pb+9/gborxjjkDRcGe0=;
 b=wQRsmo+zWSebPjh8fJS0f6gcYJ4wRNwpvkXvKpMQL67rMyWeScnPVlu3z5Zdg5+S26NqCVbPDSZemDm5zW0NNm2JZZWEQDikxwiLLRympepCtXL1HJf2oOcayfnvhDJdzg1C/NOexvOO39wQ98KxEBCMnVsE34NEf2Qx6ed1re4=
Received: from CH2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:59::26)
 by DM4PR12MB5843.namprd12.prod.outlook.com (2603:10b6:8:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 22:19:30 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::e1) by CH2PR03CA0016.outlook.office365.com
 (2603:10b6:610:59::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 5 Mar 2024 22:19:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Tue, 5 Mar 2024 22:19:29 +0000
Received: from titanite-d354host.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 16:19:28 -0600
From: Avadhut Naik <avadhut.naik@amd.com>
To: <corbet@lwn.net>
CC: <linux-doc@vger.kernel.org>, <carlos.bilbao@amd.com>,
	<linux-kernel@vger.kernel.org>, <avadnaik@amd.com>
Subject: [PATCH 4/4] docs/sp_SP: Add translation of process/2.Process.rst
Date: Tue, 5 Mar 2024 16:18:39 -0600
Message-ID: <20240305221839.2764380-5-avadhut.naik@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305221839.2764380-1-avadhut.naik@amd.com>
References: <20240305221839.2764380-1-avadhut.naik@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DM4PR12MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e27ff4-7174-4f0a-2365-08dc3d625346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e1Z/ZhdP2iq09B+IyDQrtCbrd/4FmBYVIFsZmw2mAHwaixQeW2XgklbWsg6hyXAec8TVdMY8ij1u40QKXXx3ZLl3Vb9BYMI9ZX5tbUm2aGU7YaUX5+G2KW83LmKiyr1yTrpMqzhGiDPrkEKJjsncBAf120koXqxC3ve1+Ab7/KSVHVdd0wWBUEmlPlm9Zo3ujxqT0k7ZaEu/Vawb6NOPdLdEV1tmyqutGaBWC87OV3C+DemiDBu7zt4Iofg8LEZUEtXX+oGWDLNqehXeNrAWS81fvPgAB3FcKpPmHIQgtu0vhgy0PAYqcVCHc1XYRW1s7mAPEibIZwVpk81LW2vxwSX4/xKFcsdd8H6CqaQCojGei27hQ9Rz9+bFFA5e2V2qViSMePGB7XluSmcdlHifvZ3s3cZwtojwgZhyleLgKm07RH3mDwS9092Tt/Fd3iH1fe2xzoFXv6HBZ2kklaJYcBV4+icBVA7Vqv3J/B6RcumaFPfbgMY8Kp8khUCP5rgDxAXULpJCSMa5JFQBXJjdvRKDoiWVkWKR+EVLFfRLSf81q4hJkdLtXEMnh5gOuQT5+vy0LvMOYnvL2OnPkNehTsyEfpMt+U3Khp/K0f/w90Cdzd9RhuFA5GUsAfCyyfrXK88xDDJCNhDgSTF/c6hY+WxydzF4dHYZWcrQfpZWxeWfoO4HlUVFowLvtv/IfAcWhnm9147LCD7l8dMJmkkB1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:es;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 22:19:29.2337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e27ff4-7174-4f0a-2365-08dc3d625346
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5843

Translate Documentation/process/2.Process.rst into Spanish

Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
 .../translations/sp_SP/process/2.Process.rst  | 535 +++++++++++++++++-
 .../sp_SP/process/development-process.rst     |   1 +
 2 files changed, 534 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/sp_SP/process/2.Process.rst b/Documentation/translations/sp_SP/process/2.Process.rst
index 768c43dfd805..5993eed71563 100644
--- a/Documentation/translations/sp_SP/process/2.Process.rst
+++ b/Documentation/translations/sp_SP/process/2.Process.rst
@@ -1,11 +1,542 @@
 .. include:: ../disclaimer-sp.rst
 
 :Original: Documentation/process/2.Process.rst
+:Translator: Avadhut Naik <avadhut.naik@amd.com>
 
 .. _sp_development_process:
 
 Cómo funciona el proceso de desarrollo
 ======================================
 
-.. warning::
-	TODO aún no traducido
+El desarrollo del kernel de Linux a principios de la década de 1990 fue
+un asunto relajado, con un número relativamente pequeño de usuarios y
+desarrolladores involucrados. Con una base de usuarios en los millones y
+alrededor de 2,000 desarrolladores involucrados durante un año, el kernel
+ha tenido que adaptar varios procesos para mantener el desarrollo sin
+problemas. Se requiere una comprensión solida de cómo funciona el proceso
+para ser una parte efectiva del mismo.
+
+El panorama general
+-------------------
+
+Los desarrolladores del kernel utilizan un proceso de lanzamiento basado
+en el tiempo de manera flexible, con uno nuevo lanzamiento principal del
+kernel ocurriendo cada dos o tres meses. El historial reciente de
+lanzamientos se ve así:
+
+	======  ==================
+	5.0     Marzo 3, 2019
+	5.1     Mayo 5, 2019
+	5.2     Julio 7, 2019
+	5.3     Septiembre 15, 2019
+	5.4     Noviembre 24, 2019
+	5.5     Enero 6, 2020
+	======  ==================
+
+Cada lanzamiento 5.x es un lanzamiento principal del kernel con nuevas
+características, cambios internos en la API y más. Un lanzamiento típico
+puede contener alrededor de 13,000 conjuntos de cambios incluyendo en
+varias centenas de miles de líneas de código. 5.x es la vanguardia del
+desarrollo del kernel de Linux; el kernel utiliza un modelo de desarrollo
+continuo que está integrando continuamente cambios importantes.
+
+Se sigue una disciplina relativamente sencilla con respecto a la fusión
+de parches para cada lanzamiento. Al comienzo de cada ciclo de desarrollo,
+se dice que la "merge window" (ventana de fusión) está abierta. En ese
+momento, el código que se considera lo suficientemente estable (y que es
+aceptado por la comunidad de desarrollo) se fusiona en el kernel mainline.
+La mayor parte de los cambios para un nuevo ciclo de desarrollo (y todos
+los cambios principales) se fusionarán durante este tiempo, a un ritmo
+cercano a los 1,000 cambios (“parches” o “conjuntos de cambios”) por
+día.
+
+(Aparte, vale la pena señalar que los cambios integrados durante la
+ventana de fusión no surgen de la nada; han sido recolectados, probados
+y montados con anticipación. Como funciona ese proceso se describirá en
+detalle más adelante).
+
+La ventana de fusión dura aproximadamente dos semanas. Al final de este
+tiempo, Linux Torvalds declarará que la ventana está cerrada y publicará
+el primero de los kernels “rc”. Para el kernel destinado a ser 5.6, por
+ejemplo, el lanzamiento al final de la ventana de fusión se llamará
+5.6-rc1. El lanzamiento -rc1 señala que el tiempo para fusionar nuevas
+características ha pasado y que el tiempo para estabilizar el siguiente
+kernel ha comenzado.
+
+Durante las próximas seis a diez semanas, solo los parches que solucionen
+problemas deben enviarse al mainline. En ocasiones, se permitirá un cambio
+más significativo, pero tales ocasiones son raras; los desarrolladores que
+intentan fusionar nuevas características fuera de la ventana de fusión
+suelen recibir una recepción poco amistosa. Como regla general, si se
+pierde la ventana de fusión de una característica determinada, lo mejor
+que puede hacer es esperar al siguiente ciclo de desarrollo. (Se hace una
+excepción ocasional para los drivers de hardware que no se admitía
+anteriormente; si no afectan a ningún código en árbol, no pueden causar
+regresiones y debería ser seguro agregarlos en cualquier momento).
+
+A medida que las correcciones se abren paso en el mainline, la tasa de
+parches se ralentizará con el tiempo. Linus lanza nuevos kernels -rc
+aproximadamente una vez a la semana; una serie normal llegará a algún
+punto entre -rc6 y -rc9 antes de que se considere que el kernel es
+suficientemente estable y realice el lanzamiento final. En ese momento,
+todo el proceso vuelve a empezar.
+
+Como ejemplo, así fue el ciclo de desarrollo de 5.4 (todas las fechas son
+de 2019):
+
+	==============  =======================================
+	Septiembre 15	5.3 lanzamiento estable
+	Septiembre 30	5.4-rc1, la ventana de fusion se cierra
+	Octubre 6		5.4-rc2
+	Octubre 13		5.4-rc3
+	Octubre 20		5.4-rc4
+	Octubre 27		5.4-rc5
+	Noviembre 3		5.4-rc6
+	Noviembre 10	5.4-rc7
+	Noviembre 17	5.4-rc8
+	Noviembre 24	5.4 lanzamiento estable
+	==============  =======================================
+
+¿Cómo deciden los desarrolladores cuándo cerrar el ciclo de desarrollo
+y crear el lanzamiento estable? La métrica más significativa utilizada
+es la lista de regresiones de lanzamientos anteriores. Ningunos errores
+son bienvenidos, pero aquellos que rompen sistemas que funcionaron en el
+pasado se consideran especialmente graves. Por esta razón, los parches
+que causan regresiones se ven con malos ojos y es bastante probable que
+se reviertan durante el periodo de estabilización.
+
+El objetivo de los desarrolladores es corregir todas las regresiones
+conocidas antes de que se realice el lanzamiento estable. En el mundo
+real, este tipo de perfección es difícil de lograr; hay demasiados
+variables en un proyecto de este tamaño. Llega un punto en el que
+retrasar el lanzamiento final solo empeora el problema; la pila de cambios
+que esperan la siguiente ventana de fusión crecerá, creando aún más
+regresiones la próxima vez. Por lo tanto, la mayoría de los kernels 5.x
+se lanzan con un punado de regresiones conocidas, aunque, con suerte,
+ninguna de ellas es seria.
+
+Una vez que se realiza un lanzamiento estable, su mantenimiento continuo
+se transfiere al “equipo estable”, actualmente encabezado por Greg
+Kroah-Hartman. El equipo estable lanzará actualizaciones ocasionales al
+lanzamiento estable utilizando el esquema de numeración 5.x.y. Para ser
+considerado para un lanzamiento de actualización, un parche debe
+(1) corregir un error significativo y (2) ya estar fusionado en el
+mainline para el siguiente kernel de desarrollo. Por lo general, los
+kernels recibirán actualizaciones estables durante un poco más de un
+ciclo de desarrollo después de su lanzamiento inicial. Así, por ejemplo,
+la historia del kernel 5.2 se veía así (todas las fechas en 2019):
+
+	==============  ===============================
+	Julio 7			5.2 lanzamiento estable
+	Julio 14		5.2.1
+	Julio 21		5.2.2
+	Julio 26		5.2.3
+	Julio 28		5.2.4
+	Julio 31		5.2.5
+	...				...
+	Octubre 11		5.2.21
+	==============  ===============================
+
+5.2.21 fue la última actualización estable del lanzamiento 5.2.
+
+Algunos kernels se designan como kernels “a largo plazo”; recibirán
+soporte durante un periodo más largo. Consulte el siguiente enlace para
+obtener la lista de versiones activas del kernel a largo plazos y sus
+maintainers:
+
+	https://www.kernel.org/category/releases.html
+
+La selección de un kernel para soporte a largo plazo es puramente una
+cuestión de que un maintainer tenga la necesidad y el tiempo para
+mantener ese lanzamiento. No hay planes conocidos para ofrecer soporte a
+largo plazo para ningún lanzamiento especifico próximo.
+
+Ciclo de vida de un parche
+--------------------------
+
+Los parches no van directamente desde el teclado del desarrollador al
+kernel mainline. Hay, en cambio, un proceso algo complicado (aunque algo
+informal) diseñado para garantizar que cada parche sea revisado en cuanto
+a calidad y que cada parche implemente un cambio que es deseable tener en
+el mainline. Este proceso puede ocurrir rápidamente para correcciones
+menores, o, en el caso de cambios grandes y controvertidos, continuar
+durante años. Gran parte de la frustración de los desarrolladores proviene
+de la falta de compresión de este proceso o de sus intentos de eludirlo.
+
+Con la esperanza de reducir esa frustración, este documento describirá
+cómo un parche entra en el kernel. Lo que sigue a continuación es una
+introducción que describe el proceso de una manera tanto idealizada. Un
+tratamiento mucho más detallado vendrá en secciones posteriores.
+
+Las etapas por las que pasa un parche son, generalmente:
+
+ - Diseño. Aquí es donde se establecen los requisitos reales para el
+   parche – y la forma en que se cumplirán esos requisitos. El trabajo
+   de diseño a menudo se realiza sin involucrar a la comunidad, pero es
+   mejor hacer este trabajo de manera abierta si es posible; puede ahorrar
+   mucho tiempo rediseñando las cosas más tarde.
+
+ - Revisión inicial. Los parches se publican en la lista de correo
+   relevante y los desarrolladores en esa lista responden con cualquier
+   comentario que puedan tener. Este proceso debería revelar cualquier
+   problema importante con un parche si todo va bien.
+
+ - Revisión más amplia. Cuando el parche se acerca a estar listo para su
+   inclusión en el mainline, debe ser aceptado por un maintainer del
+   subsistema relevante – aunque esta aceptación no es una garantía de
+   que el parche llegara hasta el mainline. El parche aparecerá en el
+   árbol de subsistemas del maintainer y en los árboles -next (descritos
+   a continuación). Cuando el proceso funciona, este paso conduce a una
+   revisión exhaustiva del parche y al descubrimiento de cualquier
+   problema resultante de la integración de este parche con el trabajo
+   realizado por otros.
+
+ - Tenga en cuenta que la mayoría de los maintainers también tienen
+   trabajos diurnos, por lo que fusionar su parche no puede ser su máxima
+   prioridad. Si su parche está recibiendo comentarios sobre los cambios
+   que se necesitan, debería realizar esos cambios o justificar por qué
+   no deberían realizarse. Si su parche no tiene quejas de revisión, pero
+   no está siendo fusionado por el maintainer apropiado del subsistema o
+   del driver, debe ser persistente en la actualización del parche
+   al kernel actual para que se aplique limpiamente y seguir enviándolo
+   para su revisión y fusión.
+
+ - Fusión en el mainline. Eventualmente, un parche exitoso se fusionará
+   en el repositorio mainline administrado por Linux Torvalds. Mas
+   comentarios y/o problemas pueden surgir en este momento; es importante
+   que el desarrollador responda a estos y solucione cualquier problema
+   que surja.
+
+ - Lanzamiento estable. El número de usuarios potencialmente afectados por
+   el parche es ahora grande, por lo que, una vez más, pueden surgir
+   nuevos problemas.
+
+ - Mantenimiento a largo plazo. Si bien un desarrollador puede olvidarse
+   del código después de fusionarlo, ese comportamiento tiende a dejar
+   una impresión negativa en la comunidad de desarrollo. Fusionar el
+   código elimina parte de la carga de mantenimiento; otros solucionarán
+   los problemas causados por los cambios en la API. Sin embargo, el
+   desarrollador original debe seguir asumiendo la responsabilidad del
+   código si quiere seguir siendo útil a largo plazo.
+
+Uno de los peores errores cometidos por los desarrolladores del kernel
+(o sus empleadores) es tratar de reducir el proceso a un solo paso de
+“fusión en el mainline”. Este enfoque conduce invariablemente a la
+frustración de todos los involucrados.
+
+Cómo se integran los parches en el kernel
+-----------------------------------------
+
+Hay exactamente una persona que puede fusionar parches en el repositorio
+mainline del kernel: Linus Torvalds. Pero, por ejemplo, de los más de
+9,500 parches que se incluyeron en el kernel 2.6.38, solo 112 (alrededor
+del 1.3%) fueron elegidos directamente por Linus mismo. El proyecto del
+kernel ha crecido mucho desde hace tiempo a un tamaño en el que ningún
+desarrollador individual podría inspeccionar y seleccionar todos los
+parches sin ayuda. La forma que los desarrolladores del kernel han
+abordado este crecimiento es a través del uso de un sistema jerárquico
+alrededor de una cadena de confianza.
+
+La base de código del kernel se descompone lógicamente en un conjunto de
+subsistemas: redes, soporte de arquitectura especifica, gestión de
+memoria, dispositivos de video, etc. La mayoría de los subsistemas tienen
+un maintainer designado, un desarrollador que tiene la responsabilidad
+general del código dentro de ese subsistema. Estos maintainers de
+subsistemas son los guardianes (en cierto modo) de la parte del kernel que
+gestionan; son los que (usualmente) aceptarán un parche para incluirlo en
+el kernel mainline.
+
+Cada uno de los maintainers del subsistema administra su propia versión
+del árbol de fuentes del kernel, generalmente (pero, ciertamente no
+siempre) usando la herramienta de administración de código fuente de git.
+Herramientas como git (y herramientas relacionadas como quilt o mercurial)
+permiten a los maintainers realizar un seguimiento de una lista de
+parches, incluida la información de autoría y otros metadatos. En
+cualquier momento, el maintainer puede identificar qué parches de su
+repositorio no se encuentran en el mainline.
+
+Cuando se abre la ventana de fusión, los maintainers de nivel superior
+le pedirán a Linus que “extraiga” los parches que han seleccionado para
+fusionar de sus repositorios. Si Linus está de acuerdo, el flujo de
+parches fluirá hacia su repositorio, convirtiéndose en parte del kernel
+mainline. La cantidad de atención que Linus presta a los parches
+específicos recibidos en una operación de extracción varia. Está claro
+que, a veces, examina bastante de cerca. Pero, como regla general, Linus
+confía en que los maintainers del subsistema no envíen parches
+defectuosos al upstream.
+
+Los maintainers de subsistemas, a su vez, pueden extraer parches de otros
+maintainers. Por ejemplo, el árbol de red se construye a partir de
+parches que se acumulan primero en arboles dedicados a drivers de
+dispositivos de red, redes inalámbricas, etc. Esta cadena de repositorios
+puede ser arbitrariamente larga, aunque rara vez supera los dos o tres
+enlaces. Dado que cada maintainer de la cadena confía en los que
+administran árboles de nivel inferior, este proceso se conoce como la
+“cadena de confianza”.
+
+Claramente, en un sistema como este, lograr que los parches se integren
+en el kernel depende de encontrar el maintainer adecuado. Enviar parches
+directamente a Linus no es normalmente la forma correcta de hacerlo.
+
+Árboles siguientes (next)
+-------------------------
+
+La cadena de árboles de subsistemas guía el flujo de parches en el
+kernel, pero también plantea una pregunta interesante: ¿Qué pasa si
+alguien quiere ver todos los parches que se están preparando para la
+próxima ventana de fusión? Los desarrolladores estarán interesados en
+saber que otros cambios están pendientes para ver si hay algún conflicto
+del que preocuparse; un parche que cambia un prototipo de función del
+núcleo del kernel, por ejemplo, entrará en conflicto con cualquier otro
+parche que utilice la forma anterior de esa función. Los revisores y
+probadores quieren tener acceso a los cambios en su forma integrada antes
+de que todos esos cambios se integren en el kernel mainline. Uno podría
+extraer cambios de todos los árboles de subsistemas interesantes, pero
+eso sería un trabajo tedioso y propenso a errores.
+
+La respuesta viene en forma de árboles -next, donde los árboles de
+subsistemas se recopilan para pruebas y revisiones. El más antiguo de
+estos árboles, mantenido por Andrew Morton, se llama “-mm” (por gestión
+de la memoria, que es como comenzó). El árbol “-mm” integra parches
+de una larga lista de árboles de subsistemas; también tiene algunos
+parches destinados a ayudar con la depuración.
+
+Más allá de eso, -mm contiene una colección significativa de parches
+que han sido seleccionados directamente por Andrew. Estos parches pueden
+haber sido publicados en una lista de correo o aplicarse a una parte del
+kernel para la que no hay un árbol de subsistemas designado. Como
+resultado, -mm funciona como una especie de árbol de subsistemas de
+último recurso; si no hay otro camino obvio para un parche en el mainline,
+es probable que termine en -mm. Los parches misceláneos que se acumulan
+en -mm eventualmente se enviarán a un árbol de subsistema apropiado o se
+enviarán directamente a Linus. En un ciclo de desarrollo típico,
+aproximadamente el 5-10% de los parches que van al mainline llegan allí
+a través de -mm.
+
+El parche -mm actual está disponible en el directorio “mmotm” (-mm
+del momento) en:
+
+	https://www.ozlabs.org/~akpm/mmotm/
+
+Sin embargo, es probable que el uso del árbol MMOTM sea una experiencia
+frustrante; existe una posibilidad definitiva de que ni siquiera se
+compile.
+
+El árbol principal para la fusión de parches del siguiente ciclo es
+linux-next, mantenido por Stephen Rothwell. El árbol linux-next es, por
+diseño, una instantánea de cómo se espera que se vea el mainline después
+de que se cierre la siguiente ventana de fusión. Los árboles linux-next
+se anuncian en las listas de correo linux-kernel y linux-next cuando se
+ensamblan; Se pueden descargar desde:
+
+	https://www.kernel.org/pub/linux/kernel/next/
+
+Linux-next se ha convertido en una parte integral del proceso de
+desarrollo del kernel; todos los parches fusionados durante una ventana
+de fusión determinada deberían haber encontrado su camino en linux-next
+en algún momento antes de que se abra la ventana de fusión.
+
+Árboles de staging
+------------------
+
+El árbol de fuentes del kernel contiene el directorio drivers/staging/,
+donde residen muchos subdirectorios para drivers o sistemas de archivos
+que están en proceso de ser agregados al árbol del kernel. Permanecen
+en drivers/staging mientras aún necesitan más trabajo; una vez
+completados, se pueden mover al kernel propiamente dicho. Esta es una
+forma de realizar un seguimiento de los drivers drivers que no están a la
+altura de la codificación o los estándares de calidad del kernel de
+Linux, pero que las personas pueden querer usarlos y realizar un
+seguimiento del desarrollo.
+
+Greg Kroah-Hartman mantiene actualmente el árbol de staging. Los drivers
+que aun necesitan trabajo se le envían, y cada driver tiene su propio
+subdirectorio en drivers/staging/. Junto con los archivos de origen del
+driver, también debe haber un archivo TODO en el directorio. El archivo
+TODO enumera el trabajo pendiente que el driver necesita para ser aceptado
+en el kernel propiamente dicho, así como una lista de personas a las que
+Cc’d para cualquier parche para el driver. Las reglas actuales exigen
+que los drivers que contribuyen a staging deben, como mínimo, compilarse
+correctamente.
+
+El staging puede ser una forma relativamente fácil de conseguir nuevos
+drivers en el mainline donde, con suerte, llamarán la atención de otros
+desarrolladores y mejorarán rápidamente. Sin embargo, la entrada en el
+staging no es el final de la historia; el código que no está viendo
+progreso regular eventualmente será eliminado. Los distribuidores también
+tienden a ser relativamente reacios a habilitar los drivers de staging.
+Por lo tanto, el staging es, en el mejor de los casos, una parada en el
+camino para hacia convertirse en un apropiado driver del mainline.
+
+Herramientas
+------------
+
+Como se puede ver en el texto anterior, el proceso de desarrollo del
+kernel depende en gran medida de la capacidad de dirigir colecciones de
+parches en varias direcciones. Todo ello no funcionaría tan bien como lo
+hace sin herramientas apropiadamente potentes. Los tutoriales sobre cómo
+usar estas herramientas están mucho más allá del alcance de este
+documento, pero hay espacio para algunos consejos.
+
+Con mucho, el sistema de gestión de código fuente dominante utilizado
+por la comunidad del kernel es git. Git es uno de los varios sistemas de
+control de versiones distribuidos que se están desarrollando en la
+comunidad de software libre. Está bien ajustado para el desarrollo de
+kernel, ya que funciona bastante bien cuando se trata de grandes
+repositorios y grandes cantidades de parches. También tiene la reputación
+de ser difícil de aprender y usar, aunque ha mejorado con el tiempo.
+Algún tipo de familiaridad con git es casi un requisito para los
+desarrolladores del kernel; incluso si no lo usan para su propio
+trabajo, necesitarán git para mantenerse al día con lo que otros
+desarrolladores (y el mainline) están haciendo.
+
+Git ahora está empaquetado por casi todas las distribuciones de Linux.
+Hay una página de inicio en:
+
+	https://git-scm.com/
+
+Esa página tiene punteros a documentación y tutoriales.
+
+Entre los desarrolladores de kernel que no usan git, la opción más
+popular es casi con certeza Mercurial:
+
+	https://www.selenic.com/mercurial/
+
+Mercurial comparte muchas características con git, pero proporciona una
+interfaz que muchos encuentran más fácil de usar.
+
+Otra herramienta que vale la pena conocer es Quilt:
+
+	https://savannah.nongnu.org/projects/quilt/
+
+Quilt es un sistema de gestión de parches, en lugar de un sistema de
+gestión de código fuente. No rastrea el historial a lo largo del tiempo;
+en cambio, está orientado al seguimiento de un conjunto especifico de
+cambios en relación con una base de código en evolución. Algunos de los
+principales maintainers de subsistemas utilizan Quilt para gestionar los
+parches destinados a ir upstream. Para la gestión de ciertos tipos de
+árboles (por ejemplo, -mm) Quilt es la mejor herramienta para el trabajo.
+
+Listas de correo
+----------------
+
+Una gran parte del trabajo de desarrollo del kernel de Linux se realiza a
+través de listas de correo. Es difícil ser un miembro plenamente funcional
+de la comunidad sin unirse al menos a una lista en algún parte. Pero las
+listas de correo de Linux también representan un peligro potencial para
+los desarrolladores, que corren el riesgo de quedar enterrados bajo una
+carga de correo electrónico, incumplir las convenciones utilizadas en las
+listas de Linux, o ambas cosas.
+
+La mayoría de las listas de correo del kernel se ejecutan en
+vger.kernel.org; la lista principal se puede encontrar en:
+
+	http://vger.kernel.org/vger-lists.html
+
+Sim embargo, hay listas alojadas en otros lugares; varios de ellos se
+encuentran en redhat.com/mailman/listinfo.
+
+La lista de correo principal para el desarrollo del kernel es, por
+supuesto, linux-kernel. Esta lista es un lugar intimidante; el volumen
+puede alcanzar 500 mensajes por día, la cantidad de ruido es alta, la
+conversación puede ser muy técnica y los participantes no siempre se
+preocupan por mostrar un alto grado de cortesía. Pero no hay otro lugar
+donde la comunidad de desarrollo del kernel se reúna como un todo; los
+desarrolladores que eviten esta lista se perderán información importante.
+
+Hay algunos consejos que pueden ayudar a sobrevivir en el kernel de Linux:
+
+- Haga que la lista se entregue en una carpeta separada, en lugar de su
+  buzón principal. Uno debe ser capaz de ignorar el flujo durante
+  periodos prolongados.
+
+- No trate de seguir cada conversación, nadie lo hace. Es importante
+  filtrar tanto por el tema de interés (aunque tenga en cuenta que las
+  conversaciones prolongadas pueden alejarse del asunto original sin
+  cambiar la línea de asunto del correo electrónico) por las personas
+  que participan.
+
+- No alimente a los trolls. Si alguien está tratando de provocar una
+  respuesta de enojo, ignórelos.
+
+- Al responder al correo electrónico del kernel de Linux (o al de otras
+  listas) conserve el encabezado Cc: para todos los involucrados. En
+  ausencia de una razón solida (como una solicitud explícita), nunca debe
+  eliminar destinarios. Asegúrese siempre de que la persona a la que está
+  respondiendo esté en la lista Cc:. Esta convención también hace que no
+  sea necesario solicitar explícitamente que se le copie en las respuestas
+  a sus publicaciones.
+
+- Busque en los archivos de la lista (y en la red en su conjunto) antes
+  de hacer preguntas. Algunos desarrolladores pueden impacientarse con
+  las personas que claramente no han hecho sus deberes.
+
+- Utilice respuestas intercaladas (“en línea”), lo que hace que su
+  respuesta sea más fácil de leer. (Es decir, evite top-posting – la
+  práctica de poner su respuesta encima del texto citado al que está
+  respondiendo.) Para obtener más información, consulte
+  :ref:`Documentation/translations/sp_SP/process/submitting-patches.rst <sp_interleaved_replies>`.
+
+- Pregunte en la lista de correo correcta. linux-kernel puede ser el
+  punto de encuentro general, pero no es el mejor lugar para encontrar
+  desarrolladores de todos los subsistemas.
+
+El último punto, encontrar la lista de correo correcta, es una fuente
+común de errores para desarrolladores principiantes. Alguien que haga
+una pregunta relacionada con las redes en linux-kernel seguramente
+recibirá una surgencia educada para preguntar en la lista de netdev en su
+lugar, ya que esa es la lista frecuentada por la mayoría de los
+desarrolladores de redes. Existen otras listas para los subsistemas SCSI,
+video4linux, IDE, sistema de archivos, etc. El mejor lugar para buscar
+listas de correo es en el archivo MAINTAINERS incluido con el código
+fuente del kernel.
+
+Comenzar con el desarrollo del kernel
+-------------------------------------
+
+Las preguntas sobre como comenzar con el proceso de desarrollo del kernel
+son comunes, tanto de individuos como de empresas. Igualmente comunes son
+los pasos en falso que hacen que el comienzo de la relación sea más
+difícil de lo que tiene que ser.
+
+Las empresas a menudo buscan contratar desarrolladores conocidos para
+iniciar un grupo de desarrollo. De hecho, esta puede ser una técnica
+efectiva. Pero también tiende a ser caro y no hace mucho para crecer el
+grupo de desarrolladores de kernel experimentados. Es posible poner al
+día a los desarrolladores internos en el desarrollo de kernel de Linux,
+dada la inversión de algún tiempo. Tomarse este tiempo puede dotar a un
+empleador de un grupo de desarrolladores que comprendan tanto el kernel
+como la empresa, y que también puedan ayudar a educar a otros. A medio
+plazo, este es a menudo el enfoque más rentable.
+
+Los desarrolladores individuales, a menudo, comprensiblemente, no tienen
+un lugar para empezar. Comenzar con un proyecto grande puede ser
+intimidante; a menudo uno quiere probar las aguas con algo más pequeño
+primero. Este es el punto en el que algunos desarrolladores se lanzan a
+la creación de parches para corregir errores ortográficos o problemas
+menores de estilo de codificación. Desafortunadamente, dicho parches
+crean un nivel de ruido que distrae a la comunidad de desarrollo en su
+conjunto, por lo que, cada vez más, se los mira con desprecio. Los nuevos
+desarrolladores que deseen presentarse a la comunidad no recibirán la
+recepción que desean por estos medios.
+
+Andrew Morton da este consejo (traducido) para los aspirantes a
+desarrolladores de kernel.
+
+::
+
+	El proyecto #1 para los principiantes en el kernel seguramente debería
+	ser “asegúrese de que el kernel funcione perfectamente en todo momento
+	en todas las máquinas que pueda conseguir”. Por lo general, la forma
+	de hacer esto es trabajar con otros para arreglar las cosas (¡esto
+	puede requerir persistencia!), pero eso está bien, es parte del
+	desarrollo del kernel.
+
+(https://lwn.net/Articles/283982/)
+
+En ausencia de problemas obvios que solucionar, se aconseja a los
+desarrolladores que consulten las listas actuales de regresiones y errores
+abiertos en general. Nunca faltan problemas que necesitan solución; al
+abordar estos problemas, los desarrolladores ganarán experiencia con el
+proceso mientras, al mismo tiempo, se ganarán el respeto del resto de la
+comunidad de desarrollo.
diff --git a/Documentation/translations/sp_SP/process/development-process.rst b/Documentation/translations/sp_SP/process/development-process.rst
index 17fb168418ac..40d74086f22e 100644
--- a/Documentation/translations/sp_SP/process/development-process.rst
+++ b/Documentation/translations/sp_SP/process/development-process.rst
@@ -24,3 +24,4 @@ para entenderla.
    :maxdepth: 2
 
    1.Intro
+   2.Process
-- 
2.34.1


