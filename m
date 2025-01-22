Return-Path: <linux-doc+bounces-35880-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C5A18B35
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jan 2025 06:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F02F5188BBAF
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jan 2025 05:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C8818871F;
	Wed, 22 Jan 2025 05:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lFpJ5BIk"
X-Original-To: linux-doc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DC4175D47;
	Wed, 22 Jan 2025 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737522639; cv=fail; b=l+RW+yjWvu7f20HPH+FUTbVe13cBbrnYFiujxYYY4Ztf/0VQN2//s4hXZZ1Wih/MpaYaeNLVwkLMRQsyqjYrvHwC3tEx1D6HjO+SHSfk1WxvD0emIDtVdseNHr+628XCCiFI9DPHwK6VP+KMKuFV3lnmTrPCJODy40AEW+T7XXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737522639; c=relaxed/simple;
	bh=BEX++CoVijPGvvNd/A7R05mT2E/q+PWh9F4HfRPLbO4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BFnhlf6XkTJTv9rm4Y0xwgWwZcl/gTprdspb2PhiC4PU2ZLJjkhBIWqtARUlPKvCBoREtQoxz05TplzAra5F37RJth4iX6DFVTy4CjxwiXzgwkbva9XauZHUnDFBT+i85G79EjZHDZjdPVU/aG0H1oR/lIUW1a1jcGKK6SNlViM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lFpJ5BIk; arc=fail smtp.client-ip=40.107.20.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yujwAkh4fwwLFv7roiiC/UyitBvUnGTWVztCBV8dr1DlIKeb+CVdAt12HeP4Ig0J/i/3Ooq71jVz5MqFYEYytabdT89vXDPa7HzOMz8Ks6h6bM2Z5wyyCG0xWVGwsEZrdOnrkyXab74Mim9OmCuMFmJT6llwxSyi2tF6GtAnsp/dsJawi0ctPQSW8JPkZ8IhDOdjYt0zhNEAPnomMnSmeJnrbEqfhI6gabUGUWTaa2w9v5jgHDJWKlmT/20lHpyJXB7PNrXtvR5ITE39+bJCtlgqxRpE3VSqD1YtS+0e6u/CPO0wMQSFGN99aY7ZwIgB4Xm4nIWPHLa64CbUQ1esSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz/qX28foyzB7Vraq8wr4cUq+rsu5TaCCbIhB8quOS0=;
 b=Rm0O1a6yAzmmr90Qth6csW0XYqeOE8zVQ9n0vFrZkSZMai3OQOR18fQhtyF0m7wS93fyQOiqwRbOC+6QtGtTzyE7FxYSEInmdE0MtvKRXfMrkSNUamx22Yfc+zxv+T3swKimZhmopzbtj+bgppoeR1dTY2a5AowNE8nRN2MaKeKvoelHcaBqNwRk7P2vznIzmgZRKLovksOoHh5dDHAXILDZZd7nrQE3s3rq6NNBAIIBAdC1yOccSX1w7lndAA9/UUGGPdJ8lJfnkrYaFseNHFAU0cKoFlYbjIZa1LcZgJMzpEeURDaTfcC17hWb/6mvr1NIALcj3GEPN44aU9gaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vz/qX28foyzB7Vraq8wr4cUq+rsu5TaCCbIhB8quOS0=;
 b=lFpJ5BIkSkz36dnTZafMMMVEQCaNYW1xjRCgHNAMlZRy5TtLVNBJz9eUeQePaAfsmO76Hqsnckhigq0TB5mkc75zkWyR6E5gevSjKauKQTAm8kodBY63NXPRul3+RDuL56bQjDzrBE2HSJLB1USJtVhl9JzPfi71G0KN29zu8Ug/k36N9f0/DSQu5bM8wQNbx3I40jomChM5+oATIkCcWx25HzStmDf1sXyrBZeAl6mXNGmHCLhAy3xoG/kGqjCJfJX8CYNa2VSaOHJgX9PCnNbDnNH7yvXVNwna4ySvBSAzV8yYEe4AtXa6Z9K/QJVo1212pkZ97G2bqni4FpLJqA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM0PR04MB7137.eurprd04.prod.outlook.com (2603:10a6:208:19c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 05:10:34 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 05:10:34 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: RE: [EXT] Re: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
Thread-Topic: [EXT] Re: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
Thread-Index: AQHbaxvud9MzSKjlh0OtzlcnCh8w3bMfYjZggAH0JQCAAOsj4A==
Date: Wed, 22 Jan 2025 05:10:34 +0000
Message-ID:
 <AM9PR04MB8604805D94CA63EE9F50847E95E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
 <AM9PR04MB8604228D1E99ECB45F8E0BAB95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250121-military-helpful-polecat-9ba567@lemur>
In-Reply-To: <20250121-military-helpful-polecat-9ba567@lemur>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|AM0PR04MB7137:EE_
x-ms-office365-filtering-correlation-id: 94fcbad0-9470-4942-d71d-08dd3aa319d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Eo2S+dI+mlt9PK/vMkFwDG2dYS7f0oZo5JEPSMpxZegUZE32H+E8EXdnovWN?=
 =?us-ascii?Q?JSj2sZtILo7GUPAOnmCBDy4FtzofwX6vQiB06MZ/h5+peVIh2iGdlakujGiB?=
 =?us-ascii?Q?xIWYZVmiGge7KtN3JoCVu2pBZ0gcl75c0IqKSjn6C1Kv+FQsi3+T3Ms84mKL?=
 =?us-ascii?Q?6zKf2ow6LdVea1Y5ZwjJFzWNmAJmkxreMxB/dgzKAeHKg9MGT7FP9gsBPJcy?=
 =?us-ascii?Q?JwcDAwT1XjqavlCKADQMzJCVanmPsmVB0otqQdBNozX6B151osd/Zom57lMz?=
 =?us-ascii?Q?KRtFOhVAriTJhqZeREmr9aKO9ZtUV68xP8/TzdqY+udkGhIt84XblN9aUky/?=
 =?us-ascii?Q?epFiZZTxsi/qH4I3r8cle65urXmPbz8YiYOmDCESW7BA3w2/+y2JMbZV5chJ?=
 =?us-ascii?Q?TnMSHhWJKqGDioYDuG7ARnmsVZc7iVQchkcFGVdnNsY2UYESvw1y7vgtY2ZF?=
 =?us-ascii?Q?/KwnE7EqRVcwaf4E2kJxv5FvYaeOpZB+Fc1ruvZMO2RhqeBMAGrBXh4IZewX?=
 =?us-ascii?Q?rpV4dlI1HMu5J/2fu/c4xcRmAFakHX0UlYoJ+0ujppZ65I5ubuqucmTOmUzp?=
 =?us-ascii?Q?uyemi8TfPqGfdxw3KSY+3krlNc70ycpJhBJcoPfVtITPqwSK9lHc6xRwUv0r?=
 =?us-ascii?Q?MReB72XUerUK6QNTMmIkIMcMWvYjTQdM62Sv1HlJsK3XPVPhRDw+KxtBbaE7?=
 =?us-ascii?Q?jqB/WnhFExH0eRiCobC3cerUOHb3BSLHY46AK9gIITeCuXN/GWDRbvlhcnOh?=
 =?us-ascii?Q?l2aNotliMuIyNx+WSyGuQZxu90uQcdDGZ8y+FDcMSs42D/JnI3zLSHMLfOBm?=
 =?us-ascii?Q?Tt/zTbGG8qqO1AwteAConQeZwjiNnCD9/y9JuCJUhLc/q6SoXbUQXjLLNl9j?=
 =?us-ascii?Q?8xw7z+Vs7OHdYPLXQoAHl/TTf50zo/bNcAWLMQRklI4f5Wainhb1QQzshE4Z?=
 =?us-ascii?Q?WUrCfOsbU1fn9EiRXWMgpYeCRsP8o0DyCSC2BXXfhMsPYltadIG7aJVvWgU4?=
 =?us-ascii?Q?xI0pp3Epu8slRsII/ijQ0h/0A7Gbmgo+bx0/9NrGbJY5kp6F16DQexMF25Rf?=
 =?us-ascii?Q?H0lwI5nGCBvYE5gXAPMxyZyDaWw2cHkC9VhzcTO+YB16U4GxAiLaIig8rJP0?=
 =?us-ascii?Q?SiCbNuZBtPtZ10ayJ4WJfpAFctEgLDBv37dsKzk5+K6eh+y9D809UPoxZEOx?=
 =?us-ascii?Q?RR9SEpR9clrsqXLmMLivJ+vgDv3FekLQ2WOISokwZBL9bYSn2GYPyXGpGrgx?=
 =?us-ascii?Q?7EeUI8BY8sExDXFV1DGu+skCplWH+UB28Yentcnft+Gbg2cHekJEa9tBBAky?=
 =?us-ascii?Q?5qoNey3zZ4wCzIdGp4NSt7mH6V3SbIX9W1NU0Cb6lBq/E7T81tzJ4SghOHv2?=
 =?us-ascii?Q?gvROdskKV0wraG4Pu+Ok8j6/tMAgD7kPiETzjo9fRBjeX5kas+eo3bnbYnxB?=
 =?us-ascii?Q?Yx4vHkFhGdTv7OvE7YAiMtMtYnal8umy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oFg/ODNzJmwZJyFnZ99eON1+DPeAVI7/GU/8RySI2aSM9zmQPXnVTXqqno26?=
 =?us-ascii?Q?pUOj3jmFvWh18bJWRKghVF8hfyxnPjOlPy8O/zZJTfptUAfFfluEEJfGMKXx?=
 =?us-ascii?Q?2754jJiOsAncqE3WLGrsJd0w+dY7zmenxRuCQVrs1qj5Y2sj3MkOO/c1nf2b?=
 =?us-ascii?Q?p9xkg1/jUXzUgqGs4VaESDdWyzN77Mgq/MPDZKkJ4ww8nI+h+W54YH7/STmw?=
 =?us-ascii?Q?s2nhWarf8eezMEAyGMIkubweV51JEIJozDEGa6JuxMC1KOhBTYYlZrP0bxUG?=
 =?us-ascii?Q?ckGZDrMxZEXHXVd+puGFLN+OA1TfoMUOPF0dTS0mypeCkht/TJ0Z/0O/2YLA?=
 =?us-ascii?Q?gnWB43fuZZP8tITeiLDWySiOh1HXZcxK/yomfQPpHKUmeythREln9ceYTryh?=
 =?us-ascii?Q?gHbGrwN0opSDEino9Bp8Thoy5kRuGmJSmWQ5ur/YBtUbwIWvWwtZXpD8HKuB?=
 =?us-ascii?Q?aD9jZiCy7jOp/LCKVhjpd12lB6JU4u1nly7Hbik2h49oRi9eUr6bzScWb95k?=
 =?us-ascii?Q?oGCVVtkddrEWOTuor+xIgcBUtpPQublaP4fxdZa2q+1/ZApDFhwTWTdE/tn8?=
 =?us-ascii?Q?lPPGauiGMtg+mnkkhPd9X9X0OTgPAK4SgUDfivv5/S9CV3hJ/dK3yl6VCM+6?=
 =?us-ascii?Q?MIC6ywvCnjYjRMYaSjnUYTJiknvORCqoaAawjnrQZbCTjS4HkN+1y6M5dYrz?=
 =?us-ascii?Q?uqzdrSapkHRCJHorv/TVLGxKMp8o4glyxaUc6Cs6rN63OAm060ZJCpjnuwp9?=
 =?us-ascii?Q?+RLlT1OnZXNOU9O6naphY65G67HqITPSpWEkMqEzu+9AK4bsJar3wgHXsCIV?=
 =?us-ascii?Q?8IgjUvCJ2Jp4GRA+HPnA4fsGzJSwOlvXkw/g4I7TbliaNKl20oXaRLYahCwj?=
 =?us-ascii?Q?OAW92Zsf/eQf7kkfQ6HvCfImStUTid9QBXEGEUxYKX5Xg9LJdmNBtJKJ/gKJ?=
 =?us-ascii?Q?/bjiWtRjUEBGakb2Zo12xN40nR4BT1kEGH4A2SQ1WQUUzeMsjBOcHMkTpJ8n?=
 =?us-ascii?Q?6JhhTf5uj/yL1f8ivqLxHdo9Y2jVelzR4lEqG6lsX8EVfh0JvdUGv5azM2+N?=
 =?us-ascii?Q?Ig1iiP+9kvR9sgoLUAJPb3LH8o+tRdpRLcbWyqsQQ2sfdcth46Ojs72tH94Q?=
 =?us-ascii?Q?hPdPdRdZt83/N8/lMEGjWgTCTkIA98q8DJnLmlhFMLH0pWrCSxvsm24QrVc5?=
 =?us-ascii?Q?peNnj+nmoE/Sw/St1MOaaq3pX7ycmq+i1ixsG1VlTbc9aAuPxvzBZJkEsxwR?=
 =?us-ascii?Q?LL7yP8njEqXHveaay0XeuIAX483qIW1JDwOWY3c0qjvNjWyzrMSfS0zmk6nG?=
 =?us-ascii?Q?N6xorbn/ZXzzx73IIOA5AivGFul9Np1MBgCTpKuYjwVV0e08VQvQ+/8zIIOT?=
 =?us-ascii?Q?tvmJtwPRAUHfzkrnRxFpQGWgl7paw7XLNx+IRA/nN2AVMc72PmRWaXGLpM/S?=
 =?us-ascii?Q?VLDkIK9s6jq5GNxM7yJmYkEqupe9iqJA5GBpwq3WXubeugLJgTdvX2Xt7mIY?=
 =?us-ascii?Q?b2yZ8j0GCKZVyfj5eA4SVawVoRek0kamrFUDzmARoSc/pZZsqQIk/blfmWnt?=
 =?us-ascii?Q?RwMNL16lvPZiEyd5qYv0xdIPsNn8qfOg2PWahI0R?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_002E_01DB6CBA.0FE563D0"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fcbad0-9470-4942-d71d-08dd3aa319d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 05:10:34.3841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfoyXQFFGtTP6JDOKYsjxfhSOuCcyewj/GhBfiFnYSg+uzKCQ9FoGYZGDKA62PqaHwnMI+f2hlC5mOtl6fvYBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7137

------=_NextPart_000_002E_01DB6CBA.0FE563D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks. 
I have raised the issue, by sending email to tools@kernel.org.

-----Original Message-----
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org> 
Sent: Tuesday, January 21, 2025 8:38 PM
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
<conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
<s.hauer@pengutronix.de>; Pengutronix Kernel Team <kernel@pengutronix.de>;
Fabio Estevam <festevam@gmail.com>; linux-doc@vger.kernel.org;
linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;
imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; Conor Dooley
<conor@kernel.org>
Subject: [EXT] Re: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
secure-enclave

Caution: This is an external email. Please take care when clicking links or
opening attachments. When in doubt, report the message using the 'Report
this email' button


On Mon, Jan 20, 2025 at 09:18:11AM +0000, Pankaj Gupta wrote:
> Ran "b4 send --reflect"
> But it sent to all.

I don't believe it did, at least not judging from the archives:
https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kerne
l.org%2Fall%2F20250120-imx-se-if-v11-0-4d7d8f7f4b56%40nxp.com%2F&data=05%7C0
2%7Cpankaj.gupta%40nxp.com%7C45743f164c9e45869fb708dd3a2d6fb0%7C686ea1d3bc2b
4c6fa92cd99c5c301635%7C0%7C0%7C638730689020189349%7CUnknown%7CTWFpbGZsb3d8ey
JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl
dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iplwuE1EPV3uD64A3io3EO6ixoSXVAL72FPJDBx8t9
I%3D&reserved=0

Note, that --reflect will populate the "To" and "Cc" message headers, but
won't actually send mail to those addresses.

However, if you think you found a bug in b4, please report it to
tools@kernel.org.

Regards,
-K

------=_NextPart_000_002E_01DB6CBA.0FE563D0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMjA1MTAzMlowIwYJKoZIhvcNAQkEMRYEFFPAFcahEbwQHSKWrO7Q
qItR7pg5MIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQB0vys1P67zaITT8LL6zClTGTPgcaNE4GisLv+Vc6ErS8kHLVuYYLxGR3twOz7n8RUr0rBu+8Ty
FpYXwAenObdG/CAxU3u/ROViVzcKP6reRRsKkucp6aFQB557AwtyrwQs3GhIup09fqwcPMxrVfgZ
qm4/54uxoBmNrTnOcl2euXc6H82yN2cP2ndBRUrDy40j6F0eCjCyr3zLLdtsrvaUb8j4wDRKV4rl
j8anH/Y1BtZN3qa4Wv2nPCJNWhKuYqswR7KLewkF8cTKC4OuI6BqZBwsLahJypqNACieqCsXGVdZ
bhGdviZg1t8zfnGujVovzrLspVYQfvl3qLpu88ZSAAAAAAAA

------=_NextPart_000_002E_01DB6CBA.0FE563D0--

