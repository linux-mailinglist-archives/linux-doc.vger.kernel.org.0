Return-Path: <linux-doc+bounces-13696-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91689D5F2
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 11:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C402B2475B
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 09:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1B980025;
	Tue,  9 Apr 2024 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="rzLPV5zC"
X-Original-To: linux-doc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2128.outbound.protection.outlook.com [40.107.21.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58C87F478;
	Tue,  9 Apr 2024 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656113; cv=fail; b=hxLRTVC+SWCCH0YhDeCC38WKwiVTG9Zp7alMIgbwx85UfdZt9AlW98NEZcz6z4InLfePANxnSVaN0ZsnQEi80kJ2QcnQ9ohA9I/aUqh5JGp9ERoxLMHq5P18kwlhua4zAcfl0T6xjNdyPURQKQv1mvPgOYwzjvhe1lwH22sTLgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656113; c=relaxed/simple;
	bh=rmhalswk55WdA99sGBu0U4wdTv+Bp0L/Ke2aUtG3pIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I8Z7jUVc1YI/lKz8RQhcKxLWaId4Fz0FGA0JPk9Wl2roWj5jD0SWTA6Npph6heJJen/foboA0neutEnI2xpARtZ3md4kgm3d4T0Dft1tlrqf7dCrvTt7GmOnjekj+zrVxMtLYAtxo66Xev4itIdSrgLJ7D1oyYmV4qtdGwgFqhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=rzLPV5zC; arc=fail smtp.client-ip=40.107.21.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/CwaRGvUHed8k/JTUpSrKW59iZrjo9epTF4hG8+TWHlW5GdgoiSmXHH2SZwEPjtTx/3s5jq0gmBzuTrVYDPxgcb0u9BiGZrfqSNgVzjxGzEV6/5oiV1Jq8L890nzpZYRf7bfk+h/zSCGGQt/u6b7c7Cnb3QwW/Oq30Q/GekZL1kNP3+pSS4AwXW3vMjVvKSRydy6guZcfOOZSnnZJ96qE3B16jhw9aNRo0X1F+MPCDUfDAPWkXy/bD18Ltad78Oa3g9CTdlL+0+egP9kCzwTBejtjXrUV1x6yhrs5CjN0zMfPBHddhhzOJcKlQ9FsrTDDAhNJlpjPTIb0QonjUlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmhalswk55WdA99sGBu0U4wdTv+Bp0L/Ke2aUtG3pIM=;
 b=f3Q9XvmMa8VpoXlI68QfDDSrxwPi4rat2g7sudMdBEnr1emJBmekJNvlxnp07lwidOOBq9RwHZRrSDv7wV9zJtuB9DIzffXctrMp9BhtEpQWQnX/s70mumutJvLtgS0QUXo+RAOepCsaLDtd+pZ3+VpkkHcivUvfgJibNbtyq0sAJKBkUH9koTHsli8ern+P1ONyh0SNGoM7A3eeyXKJXqTDwTGTJEeMIjHnV8XlvMp7uzzBcGGZzJRnf7xaKQlATXTC5Zpl3eDB9IfLB2m6D4al8YV7q7pKEHc2R0mTIF6Zg7FY6NfF+GXEhpTINKrDVyP2Gr1wfzPGR9OyZSSetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmhalswk55WdA99sGBu0U4wdTv+Bp0L/Ke2aUtG3pIM=;
 b=rzLPV5zCbCfLtTEseFc0tcM/1yWP94R/qiMPKJUsaXIMBy+IEpIzbeyo48rC1Ef8MnXN/tNy9f2bl9tP15Dh+FmB8gms/7Dle5Ae1plucdgYVqOablHZl4vlX9eV6KNztyOxsaHhXk5m4eprtCDklUiKrxHGVRUk8XG2VbVxYTw=
Received: from DB6PR04MB3190.eurprd04.prod.outlook.com (2603:10a6:6:5::31) by
 PAXPR04MB8512.eurprd04.prod.outlook.com (2603:10a6:102:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 09:48:27 +0000
Received: from DB6PR04MB3190.eurprd04.prod.outlook.com
 ([fe80::e8bc:451:6316:4a6f]) by DB6PR04MB3190.eurprd04.prod.outlook.com
 ([fe80::e8bc:451:6316:4a6f%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 09:48:27 +0000
From: Kshitiz Varshney <kshitiz.varshney@nxp.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, David Gstir <david@sigma-star.at>,
	Mimi Zohar <zohar@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>
CC: Shawn Guo <shawnguo@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx
	<linux-imx@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, sigma star
 Kernel Team <upstream+dcp@sigma-star.at>, David Howells
	<dhowells@redhat.com>, Li Yang <leoyang.li@nxp.com>, Paul Moore
	<paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
	<serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Randy Dunlap
	<rdunlap@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "Rafael
 J. Wysocki" <rafael.j.wysocki@intel.com>, Tejun Heo <tj@kernel.org>, "Steven
 Rostedt (Google)" <rostedt@goodmis.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-integrity@vger.kernel.org"
	<linux-integrity@vger.kernel.org>, "keyrings@vger.kernel.org"
	<keyrings@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>, Varun Sethi
	<V.Sethi@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>
Subject: RE: [EXT] Re: [PATCH v8 6/6] docs: trusted-encrypted: add DCP as new
 trust source
Thread-Topic: [EXT] Re: [PATCH v8 6/6] docs: trusted-encrypted: add DCP as new
 trust source
Thread-Index: AQHahd5ZPsPUUHSBS06BOt9//l0ZJbFfubhQ
Date: Tue, 9 Apr 2024 09:48:27 +0000
Message-ID:
 <DB6PR04MB3190F6B78FF3760EBCC14E758F072@DB6PR04MB3190.eurprd04.prod.outlook.com>
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-7-david@sigma-star.at>
 <D0ALT2QCUIYB.8NFTE7Z18JKN@kernel.org>
In-Reply-To: <D0ALT2QCUIYB.8NFTE7Z18JKN@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR04MB3190:EE_|PAXPR04MB8512:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 r01T+j/pItGtZqoS/Z3Hn8Lh7fhqAzKnpVwknOXHR1/jZ7Y9SH94nPVcGVbv9J4iJTXGGBvq8UK5uQ5vrsKRUF9U7uzVK6n1levhvqF3OpWPofRl9Pv+rZ2oKt1KREt++Njf/LP1OawFjp+Da6D9njVgJJUOTxQQoMBndCozyqXUq2m1zImwqdmrVLCFM2ayoYFFwPCmidCJPIsCSEZjoeh0LUoRnandQYkrCie0Zi9jHQjYURZfjBS0QbRjjOqlayNcvA+ufIjToLjxfIKfgp1NBH9499aLVIVetsFVQUzDgfwz0oUFlfhljeo4RAV9ScUTnHtu5u2RWL5NQerBH5mhPfiWTgpCs5gAxUo0d3TLMUg6GLhgIbulw9c//ImFwd+9XWDz+GE/zXINtt9AkF3Pj44/vUfBLYgeC4vUZodeLHqE0fYjV32BFcgV7DnKqkWw87GLOsvf0Xbb3KnqLhn7K/yzlhBHQUPWduV8PFR6Fza4XU9wnKHjHOnSALq6PEUB6BwQttACv97gS2cQkeicH15wnBayebau59mY/mMS9YZiZt+GmvGpnJ0mCQBzcZ/R6odnZp6RI0dXgICuVWuLoeVkX2yix6nPQt80L2v7kMT3dNn6yrpDqJ8onlgv/5P0Wx9AfI73DI88lav1o1U0yXxgUlIYsDWiFmHh/3c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR04MB3190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cG5FdFVSN2U3dmUzSHNzOGI1YVlzbml4ekE2RUVBamJlLzZBTloxOFA5dFZH?=
 =?utf-8?B?SSt1MGNxUWtSR0FTSThxdUJDMDlYSzJCY3JuQ1p1N3h4NXZYVGNCOHA3QnRw?=
 =?utf-8?B?M3ByNVAyaDNIcElmVzNSZnVLeXlJdDZvdXExS3BjQmNDUXZ0T2tUS3hENC8r?=
 =?utf-8?B?L1p1SEpNRWZLa21BazBPUVN1aHBvWnVrYWJyTElScCtTY0FWRWhLVG9OTWFi?=
 =?utf-8?B?aWl4SWZXZlNPMEdJTkV3RllOdG9UV0hBMTlmRFNDVUI1UHBwUEZrMUV2bGEy?=
 =?utf-8?B?MHNZYXZpVUJ1OEhqM1FrZzFyemorZFpxRTFzNlhlZytMTHdMdk1aaCtzSisy?=
 =?utf-8?B?S001MkRoRXFFQnJ5SkpoV2l6RFlySEF6d0FpYlpVSFFFTWRrSE9wREVHMFMw?=
 =?utf-8?B?a3BzUlJhS3k2aW13MkN1ZHpoaHAyMngxT1hnbE50dEZDRUpNTTYzWHFVdC8y?=
 =?utf-8?B?M1FabVB5cHo2T3cyWS96U2k3Q2cxeUZvM29ENHh4ZndGQUtsZ1Z3T3UzN0g0?=
 =?utf-8?B?dENwejc0d0UzajA0WU5Sb21sdWVvbVlGKytuSUxsU2NocFVXeDFBMnhCVDBU?=
 =?utf-8?B?THNPQWQzQTgvZm5wS253UEVoQS9EaG5lTTFXWVFoN0JqUUdHUmxlaFpidnls?=
 =?utf-8?B?U1M4elFYZi9kb1MzaSsyR2x1NmFiY3QvNDRTKzNCNGprTlo3b2dRSEhqWjJO?=
 =?utf-8?B?WW1ZcVZMUElEUmI4aGN0WGk5MlhuRWdBTTdXY2UrQnNoTmJ4eE1XVUdndFJS?=
 =?utf-8?B?VkVTY09WSUI3TUxxSEtmdjliWjArZ3pLT0hubjVHTmh2MHBmcWcrcGxvVVFS?=
 =?utf-8?B?UFZPcWFyb1Nzdlh5dy9lNGNyV0k1WjZvOVpyQUQvdGUwRS94T3FTK3FqL3dh?=
 =?utf-8?B?RzZDcG96YTZEb1EwRWtzSitOVW1POG1HU2dSQ29EcmRUd0tleWxBQjBxai9k?=
 =?utf-8?B?RnFRNUFiWlRDSWVoWGRRa0JoampVbG1QYTNMWmlLUkFBSnVMZnhGWUw5TmhE?=
 =?utf-8?B?UnFCa0FUc1dBL25rTjNTdlZ4QndsMVdUKzVoR3dKT3BkMTJ3ZUlaRzFRR01y?=
 =?utf-8?B?a2daUnFBQTNWMGIzcXJSckJoY0JQOHV4V2g4Ni96dElMdHVneC9xcTAvcGln?=
 =?utf-8?B?V3R5Z3hpSmdlY3V5WnoyN0FxakQ4d2ZxUFdaSWlwU3ZINU9PU2k3bit3bHli?=
 =?utf-8?B?WmVsT29ERXJCTkk2MXdhaGduOTVvWG5Hdy9DdGlrRVJPVXBCT0EwRnhMWDlw?=
 =?utf-8?B?c2hqOUNaem12dVBIRGowazZFZ055Qk1NdXdMSWtPeXE0REZWb2lQdWI5RFpo?=
 =?utf-8?B?ckFvSmxua0tWeUg4bWc2SjVOY2hQUkRETjdQeEcrOGo1Z3hsa25QMW95VjRH?=
 =?utf-8?B?QlJ4WnIwdE1Wc0UxUjN5Nlh2b1VYUTJjeWdDVzQrSE1kSlFjVkdiYnV5Y2tO?=
 =?utf-8?B?aDAyNFcyWjVpK1FzS1NQMVhlZkhSKytjNktYVkNUS2V4YlkrUCtvVmVZeC9P?=
 =?utf-8?B?Y3c4S1JVYjZlWkFoU0lCMXZrQW5jVWtvTUNUQVl3WG9seXdCOEwwMHdzOWZQ?=
 =?utf-8?B?Wm5Vd3hTRTlLTjk1eDdKSmpTVlhwNFg4TDk4ZVhXaEN4Nkwzcko2MDdIbEJq?=
 =?utf-8?B?YTdzQytlMmxNTzJua1VSSjJuUUQrWjYyOE1YSmwydDVUa0xsRGs3dzE4TFNm?=
 =?utf-8?B?VnBBZWtCSCtLQW1nVHY2QWdtbHltSnFhT050bkhKR2dPUklPTmNTT1owY21z?=
 =?utf-8?B?UkZ3SnkyVHp0MU5ETDdXeFlNRkd6N1FTRHRZOFRrYUkwVmxWOHYxRWZSSEd0?=
 =?utf-8?B?cS9oNFFEQ2F5eVQ2M0JYT1JoOW9zVVNyWlhZSkZRVmliNzRvT3dvUTNibTgw?=
 =?utf-8?B?cVplR1M0bnFFYWh3TTZvdzkrUnh3eUpYVHloQXhIeG0wNVdtUk9lVmVGckRB?=
 =?utf-8?B?TDdWc1pXMWlHbXJkaFIzYVZncm52VXlkUTc0c3BtVWJiVlFRNHFvZGNvdDZy?=
 =?utf-8?B?RG5WNkZVR0txdTd5UlgrVUVxY0M0ZVhMbDZQRDFBSkExdHNjUHhsaU1HV0Q3?=
 =?utf-8?B?YXIrdnpWRjBzeGxWTktNWGp3SkNYbW5KbVJnV2V3dCtwbTJUTU13WGV6TW83?=
 =?utf-8?Q?8vJwBPGGXtwLbOFOQAGy8OGIr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR04MB3190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ef2067-4bc3-499c-748d-08dc587a34ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 09:48:27.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EssHdgkHqyUvIJ0w5IdPM0kF88WPtYW+9zPoMO6LhWR1aDJV92iTSO+RC+HdMqQowVQVZoCvogiEzv90776i4AUj8Th4jQXT2/Qh30CpP7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8512

SGkgSmFya2tvLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFy
a2tvIFNha2tpbmVuIDxqYXJra29Aa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJp
bCAzLCAyMDI0IDk6MTggUE0NCj4gVG86IERhdmlkIEdzdGlyIDxkYXZpZEBzaWdtYS1zdGFyLmF0
PjsgTWltaSBab2hhciA8em9oYXJAbGludXguaWJtLmNvbT47DQo+IEphbWVzIEJvdHRvbWxleSA8
amVqYkBsaW51eC5pYm0uY29tPjsgSGVyYmVydCBYdQ0KPiA8aGVyYmVydEBnb25kb3IuYXBhbmEu
b3JnLmF1PjsgRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0Pg0KPiBDYzogU2hh
d24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29yYmV0DQo+IDxjb3JiZXRA
bHduLm5ldD47IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJv
bml4DQo+IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFt
DQo+IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29t
PjsgQWhtYWQgRmF0b3VtDQo+IDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT47IHNpZ21hIHN0YXIg
S2VybmVsIFRlYW0NCj4gPHVwc3RyZWFtK2RjcEBzaWdtYS1zdGFyLmF0PjsgRGF2aWQgSG93ZWxs
cyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT47IExpDQo+IFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT47
IFBhdWwgTW9vcmUgPHBhdWxAcGF1bC1tb29yZS5jb20+OyBKYW1lcw0KPiBNb3JyaXMgPGptb3Jy
aXNAbmFtZWkub3JnPjsgU2VyZ2UgRS4gSGFsbHluIDxzZXJnZUBoYWxseW4uY29tPjsgUGF1bCBF
Lg0KPiBNY0tlbm5leSA8cGF1bG1ja0BrZXJuZWwub3JnPjsgUmFuZHkgRHVubGFwIDxyZHVubGFw
QGluZnJhZGVhZC5vcmc+Ow0KPiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0u
Y29tPjsgUmFmYWVsIEouIFd5c29ja2kNCj4gPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPjsg
VGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPjsgU3RldmVuIFJvc3RlZHQNCj4gKEdvb2dsZSkgPHJv
c3RlZHRAZ29vZG1pcy5vcmc+OyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4g
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtaW50ZWdyaXR5QHZnZXIua2VybmVsLm9yZzsN
Cj4ga2V5cmluZ3NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1jcnlwdG9Admdlci5rZXJuZWwub3Jn
OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eHBwYy1kZXZA
bGlzdHMub3psYWJzLm9yZzsgbGludXgtc2VjdXJpdHktDQo+IG1vZHVsZUB2Z2VyLmtlcm5lbC5v
cmc7IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+OyBEYXZpZA0KPiBPYmVyaG9s
bGVuemVyIDxkYXZpZC5vYmVyaG9sbGVuemVyQHNpZ21hLXN0YXIuYXQ+DQo+IFN1YmplY3Q6IFtF
WFRdIFJlOiBbUEFUQ0ggdjggNi82XSBkb2NzOiB0cnVzdGVkLWVuY3J5cHRlZDogYWRkIERDUCBh
cyBuZXcNCj4gdHJ1c3Qgc291cmNlDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFs
IGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4gb3Blbmlu
ZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRo
ZSAnUmVwb3J0DQo+IHRoaXMgZW1haWwnIGJ1dHRvbg0KPiANCj4gDQo+IE9uIFdlZCBBcHIgMywg
MjAyNCBhdCAxMDoyMSBBTSBFRVNULCBEYXZpZCBHc3RpciB3cm90ZToNCj4gPiBVcGRhdGUgdGhl
IGRvY3VtZW50YXRpb24gZm9yIHRydXN0ZWQgYW5kIGVuY3J5cHRlZCBLRVlTIHdpdGggRENQIGFz
DQo+ID4gbmV3IHRydXN0IHNvdXJjZToNCj4gPg0KPiA+IC0gRGVzY3JpYmUgc2VjdXJpdHkgcHJv
cGVydGllcyBvZiBEQ1AgdHJ1c3Qgc291cmNlDQo+ID4gLSBEZXNjcmliZSBrZXkgdXNhZ2UNCj4g
PiAtIERvY3VtZW50IGJsb2IgZm9ybWF0DQo+ID4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IFJpY2hh
cmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IERhdmlk
IE9iZXJob2xsZW56ZXINCj4gPiA8ZGF2aWQub2JlcmhvbGxlbnplckBzaWdtYS1zdGFyLmF0Pg0K
PiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56
ZXJAc2lnbWEtc3Rhci5hdD4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHc3RpciA8ZGF2aWRA
c2lnbWEtc3Rhci5hdD4NCj4gPiAtLS0NCj4gPiAgLi4uL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1l
bmNyeXB0ZWQucnN0ICAgICAgIHwgNTMgKysrKysrKysrKysrKysrKysrKw0KPiA+ICBzZWN1cml0
eS9rZXlzL3RydXN0ZWQta2V5cy90cnVzdGVkX2RjcC5jICAgICAgfCAxOSArKysrKysrDQo+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vc2VjdXJpdHkva2V5cy90cnVzdGVkLWVuY3J5cHRlZC5yc3QNCj4gPiBi
L0RvY3VtZW50YXRpb24vc2VjdXJpdHkva2V5cy90cnVzdGVkLWVuY3J5cHRlZC5yc3QNCj4gPiBp
bmRleCBlOTg5Yjk4MDJmOTIuLmY0ZDdlMTYyZDVlNCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1lbmNyeXB0ZWQucnN0DQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9zZWN1cml0eS9rZXlzL3RydXN0ZWQtZW5jcnlwdGVkLnJzdA0KPiA+IEBAIC00
Miw2ICs0MiwxNCBAQCBzYWZlLg0KPiA+ICAgICAgICAgICByYW5kb21seSBnZW5lcmF0ZWQgYW5k
IGZ1c2VkIGludG8gZWFjaCBTb0MgYXQgbWFudWZhY3R1cmluZyB0aW1lLg0KPiA+ICAgICAgICAg
ICBPdGhlcndpc2UsIGEgY29tbW9uIGZpeGVkIHRlc3Qga2V5IGlzIHVzZWQgaW5zdGVhZC4NCj4g
Pg0KPiA+ICsgICAgICg0KSBEQ1AgKERhdGEgQ28tUHJvY2Vzc29yOiBjcnlwdG8gYWNjZWxlcmF0
b3Igb2YgdmFyaW91cyBpLk1YDQo+ID4gKyBTb0NzKQ0KPiA+ICsNCj4gPiArICAgICAgICAgUm9v
dGVkIHRvIGEgb25lLXRpbWUgcHJvZ3JhbW1hYmxlIGtleSAoT1RQKSB0aGF0IGlzIGdlbmVyYWxs
eQ0KPiBidXJudA0KPiA+ICsgICAgICAgICBpbiB0aGUgb24tY2hpcCBmdXNlcyBhbmQgaXMgYWNj
ZXNzaWJsZSB0byB0aGUgRENQIGVuY3J5cHRpb24gZW5naW5lDQo+IG9ubHkuDQo+ID4gKyAgICAg
ICAgIERDUCBwcm92aWRlcyB0d28ga2V5cyB0aGF0IGNhbiBiZSB1c2VkIGFzIHJvb3Qgb2YgdHJ1
c3Q6IHRoZSBPVFANCj4ga2V5DQo+ID4gKyAgICAgICAgIGFuZCB0aGUgVU5JUVVFIGtleS4gRGVm
YXVsdCBpcyB0byB1c2UgdGhlIFVOSVFVRSBrZXksIGJ1dCBzZWxlY3RpbmcNCj4gPiArICAgICAg
ICAgdGhlIE9UUCBrZXkgY2FuIGJlIGRvbmUgdmlhIGEgbW9kdWxlIHBhcmFtZXRlcg0KPiAoZGNw
X3VzZV9vdHBfa2V5KS4NCj4gPiArDQo+ID4gICAgKiAgRXhlY3V0aW9uIGlzb2xhdGlvbg0KPiA+
DQo+ID4gICAgICAgKDEpIFRQTQ0KPiA+IEBAIC01Nyw2ICs2NSwxMiBAQCBzYWZlLg0KPiA+DQo+
ID4gICAgICAgICAgIEZpeGVkIHNldCBvZiBvcGVyYXRpb25zIHJ1bm5pbmcgaW4gaXNvbGF0ZWQg
ZXhlY3V0aW9uIGVudmlyb25tZW50Lg0KPiA+DQo+ID4gKyAgICAgKDQpIERDUA0KPiA+ICsNCj4g
PiArICAgICAgICAgRml4ZWQgc2V0IG9mIGNyeXB0b2dyYXBoaWMgb3BlcmF0aW9ucyBydW5uaW5n
IGluIGlzb2xhdGVkIGV4ZWN1dGlvbg0KPiA+ICsgICAgICAgICBlbnZpcm9ubWVudC4gT25seSBi
YXNpYyBibG9iIGtleSBlbmNyeXB0aW9uIGlzIGV4ZWN1dGVkIHRoZXJlLg0KPiA+ICsgICAgICAg
ICBUaGUgYWN0dWFsIGtleSBzZWFsaW5nL3Vuc2VhbGluZyBpcyBkb25lIG9uIG1haW4gcHJvY2Vz
c29yL2tlcm5lbA0KPiBzcGFjZS4NCj4gPiArDQo+ID4gICAgKiBPcHRpb25hbCBiaW5kaW5nIHRv
IHBsYXRmb3JtIGludGVncml0eSBzdGF0ZQ0KPiA+DQo+ID4gICAgICAgKDEpIFRQTQ0KPiA+IEBA
IC03OSw2ICs5MywxMSBAQCBzYWZlLg0KPiA+ICAgICAgICAgICBSZWxpZXMgb24gdGhlIEhpZ2gg
QXNzdXJhbmNlIEJvb3QgKEhBQikgbWVjaGFuaXNtIG9mIE5YUCBTb0NzDQo+ID4gICAgICAgICAg
IGZvciBwbGF0Zm9ybSBpbnRlZ3JpdHkuDQo+ID4NCj4gPiArICAgICAoNCkgRENQDQo+ID4gKw0K
PiA+ICsgICAgICAgICBSZWxpZXMgb24gU2VjdXJlL1RydXN0ZWQgYm9vdCBwcm9jZXNzIChjYWxs
ZWQgSEFCIGJ5IHZlbmRvcikgZm9yDQo+ID4gKyAgICAgICAgIHBsYXRmb3JtIGludGVncml0eS4N
Cj4gPiArDQo+ID4gICAgKiAgSW50ZXJmYWNlcyBhbmQgQVBJcw0KPiA+DQo+ID4gICAgICAgKDEp
IFRQTQ0KPiA+IEBAIC05NCw2ICsxMTMsMTEgQEAgc2FmZS4NCj4gPg0KPiA+ICAgICAgICAgICBJ
bnRlcmZhY2UgaXMgc3BlY2lmaWMgdG8gc2lsaWNvbiB2ZW5kb3IuDQo+ID4NCj4gPiArICAgICAo
NCkgRENQDQo+ID4gKw0KPiA+ICsgICAgICAgICBWZW5kb3Itc3BlY2lmaWMgQVBJIHRoYXQgaXMg
aW1wbGVtZW50ZWQgYXMgcGFydCBvZiB0aGUgRENQIGNyeXB0bw0KPiBkcml2ZXIgaW4NCj4gPiAr
ICAgICAgICAgYGBkcml2ZXJzL2NyeXB0by9teHMtZGNwLmNgYC4NCj4gPiArDQo+ID4gICAgKiAg
VGhyZWF0IG1vZGVsDQo+ID4NCj4gPiAgICAgICBUaGUgc3RyZW5ndGggYW5kIGFwcHJvcHJpYXRl
bmVzcyBvZiBhIHBhcnRpY3VsYXIgdHJ1c3Qgc291cmNlDQo+ID4gZm9yIGEgZ2l2ZW4gQEAgLTEy
OSw2ICsxNTMsMTMgQEAgc2VsZWN0ZWQgdHJ1c3Qgc291cmNlOg0KPiA+ICAgICAgIENBQU0gSFdS
TkcsIGVuYWJsZSBDUllQVE9fREVWX0ZTTF9DQUFNX1JOR19BUEkgYW5kIGVuc3VyZQ0KPiB0aGUg
ZGV2aWNlDQo+ID4gICAgICAgaXMgcHJvYmVkLg0KPiA+DQo+ID4gKyAgKiAgRENQIChEYXRhIENv
LVByb2Nlc3NvcjogY3J5cHRvIGFjY2VsZXJhdG9yIG9mIHZhcmlvdXMgaS5NWCBTb0NzKQ0KPiA+
ICsNCj4gPiArICAgICBUaGUgRENQIGhhcmR3YXJlIGRldmljZSBpdHNlbGYgZG9lcyBub3QgcHJv
dmlkZSBhIGRlZGljYXRlZCBSTkcNCj4gaW50ZXJmYWNlLA0KPiA+ICsgICAgIHNvIHRoZSBrZXJu
ZWwgZGVmYXVsdCBSTkcgaXMgdXNlZC4gU29DcyB3aXRoIERDUCBsaWtlIHRoZSBpLk1YNlVMTCBk
bw0KPiBoYXZlDQo+ID4gKyAgICAgYSBkZWRpY2F0ZWQgaGFyZHdhcmUgUk5HIHRoYXQgaXMgaW5k
ZXBlbmRlbnQgZnJvbSBEQ1Agd2hpY2ggY2FuIGJlDQo+IGVuYWJsZWQNCj4gPiArICAgICB0byBi
YWNrIHRoZSBrZXJuZWwgUk5HLg0KPiA+ICsNCj4gPiAgVXNlcnMgbWF5IG92ZXJyaWRlIHRoaXMg
Ynkgc3BlY2lmeWluZyBgYHRydXN0ZWQucm5nPWtlcm5lbGBgIG9uIHRoZQ0KPiA+IGtlcm5lbCAg
Y29tbWFuZC1saW5lIHRvIG92ZXJyaWRlIHRoZSB1c2VkIFJORyB3aXRoIHRoZSBrZXJuZWwncyBy
YW5kb20NCj4gbnVtYmVyIHBvb2wuDQo+ID4NCj4gPiBAQCAtMjMxLDYgKzI2MiwxOSBAQCBVc2Fn
ZTo6DQo+ID4gIENBQU0tc3BlY2lmaWMgZm9ybWF0LiAgVGhlIGtleSBsZW5ndGggZm9yIG5ldyBr
ZXlzIGlzIGFsd2F5cyBpbiBieXRlcy4NCj4gPiAgVHJ1c3RlZCBLZXlzIGNhbiBiZSAzMiAtIDEy
OCBieXRlcyAoMjU2IC0gMTAyNCBiaXRzKS4NCj4gPg0KPiA+ICtUcnVzdGVkIEtleXMgdXNhZ2U6
IERDUA0KPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiArVXNhZ2U6Og0K
PiA+ICsNCj4gPiArICAgIGtleWN0bCBhZGQgdHJ1c3RlZCBuYW1lICJuZXcga2V5bGVuIiByaW5n
DQo+ID4gKyAgICBrZXljdGwgYWRkIHRydXN0ZWQgbmFtZSAibG9hZCBoZXhfYmxvYiIgcmluZw0K
PiA+ICsgICAga2V5Y3RsIHByaW50IGtleWlkDQo+ID4gKw0KPiA+ICsia2V5Y3RsIHByaW50IiBy
ZXR1cm5zIGFuIEFTQ0lJIGhleCBjb3B5IG9mIHRoZSBzZWFsZWQga2V5LCB3aGljaCBpcw0KPiA+
ICtpbiBmb3JtYXQgc3BlY2lmaWMgdG8gdGhpcyBEQ1Aga2V5LWJsb2IgaW1wbGVtZW50YXRpb24u
ICBUaGUga2V5DQo+ID4gK2xlbmd0aCBmb3IgbmV3IGtleXMgaXMgYWx3YXlzIGluIGJ5dGVzLiBU
cnVzdGVkIEtleXMgY2FuIGJlIDMyIC0gMTI4IGJ5dGVzDQo+ICgyNTYgLSAxMDI0IGJpdHMpLg0K
PiA+ICsNCj4gPiAgRW5jcnlwdGVkIEtleXMgdXNhZ2UNCj4gPiAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gPg0KPiA+IEBAIC00MjYsMyArNDcwLDEyIEBAIHN0cmluZyBsZW5ndGguDQo+ID4gIHBy
aXZrZXkgaXMgdGhlIGJpbmFyeSByZXByZXNlbnRhdGlvbiBvZiBUUE0yQl9QVUJMSUMgZXhjbHVk
aW5nIHRoZQ0KPiA+IGluaXRpYWwgVFBNMkIgaGVhZGVyIHdoaWNoIGNhbiBiZSByZWNvbnN0cnVj
dGVkIGZyb20gdGhlIEFTTi4xIG9jdGVkDQo+ID4gc3RyaW5nIGxlbmd0aC4NCj4gPiArDQo+ID4g
K0RDUCBCbG9iIEZvcm1hdA0KPiA+ICstLS0tLS0tLS0tLS0tLS0NCj4gPiArDQo+ID4gKy4uIGtl
cm5lbC1kb2M6OiBzZWN1cml0eS9rZXlzL3RydXN0ZWQta2V5cy90cnVzdGVkX2RjcC5jDQo+ID4g
KyAgIDpkb2M6IGRjcCBibG9iIGZvcm1hdA0KPiA+ICsNCj4gPiArLi4ga2VybmVsLWRvYzo6IHNl
Y3VyaXR5L2tleXMvdHJ1c3RlZC1rZXlzL3RydXN0ZWRfZGNwLmMNCj4gPiArICAgOmlkZW50aWZp
ZXJzOiBzdHJ1Y3QgZGNwX2Jsb2JfZm10DQo+ID4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2tleXMv
dHJ1c3RlZC1rZXlzL3RydXN0ZWRfZGNwLmMNCj4gPiBiL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1r
ZXlzL3RydXN0ZWRfZGNwLmMNCj4gPiBpbmRleCAxNmM0NGFhZmVhYjMuLmI1ZjgxYTA1YmUzNiAx
MDA2NDQNCj4gPiAtLS0gYS9zZWN1cml0eS9rZXlzL3RydXN0ZWQta2V5cy90cnVzdGVkX2RjcC5j
DQo+ID4gKysrIGIvc2VjdXJpdHkva2V5cy90cnVzdGVkLWtleXMvdHJ1c3RlZF9kY3AuYw0KPiA+
IEBAIC0xOSw2ICsxOSwyNSBAQA0KPiA+ICAjZGVmaW5lIERDUF9CTE9CX1ZFUlNJT04gMQ0KPiA+
ICAjZGVmaW5lIERDUF9CTE9CX0FVVEhMRU4gMTYNCj4gPg0KPiA+ICsvKioNCj4gPiArICogRE9D
OiBkY3AgYmxvYiBmb3JtYXQNCj4gPiArICoNCj4gPiArICogVGhlIERhdGEgQ28tUHJvY2Vzc29y
IChEQ1ApIHByb3ZpZGVzIGhhcmR3YXJlLWJvdW5kIEFFUyBrZXlzIHVzaW5nDQo+ID4gK2l0cw0K
PiA+ICsgKiBBRVMgZW5jcnlwdGlvbiBlbmdpbmUgb25seS4gSXQgZG9lcyBub3QgcHJvdmlkZSBk
aXJlY3Qga2V5DQo+IHNlYWxpbmcvdW5zZWFsaW5nLg0KPiA+ICsgKiBUbyBtYWtlIERDUCBoYXJk
d2FyZSBlbmNyeXB0aW9uIGtleXMgdXNhYmxlIGFzIHRydXN0IHNvdXJjZSwgd2UNCj4gPiArZGVm
aW5lDQo+ID4gKyAqIG91ciBvd24gY3VzdG9tIGZvcm1hdCB0aGF0IHVzZXMgYSBoYXJkd2FyZS1i
b3VuZCBrZXkgdG8gc2VjdXJlIHRoZQ0KPiA+ICtzZWFsaW5nDQo+ID4gKyAqIGtleSBzdG9yZWQg
aW4gdGhlIGtleSBibG9iLg0KPiA+ICsgKg0KPiA+ICsgKiBXaGVuZXZlciBhIG5ldyB0cnVzdGVk
IGtleSB1c2luZyBEQ1AgaXMgZ2VuZXJhdGVkLCB3ZSBnZW5lcmF0ZSBhDQo+ID4gK3JhbmRvbSAx
MjgtYml0DQo+ID4gKyAqIGJsb2IgZW5jcnlwdGlvbiBrZXkgKEJFSykgYW5kIDEyOC1iaXQgbm9u
Y2UuIFRoZSBCRUsgYW5kIG5vbmNlIGFyZQ0KPiA+ICt1c2VkIHRvDQo+ID4gKyAqIGVuY3J5cHQg
dGhlIHRydXN0ZWQga2V5IHBheWxvYWQgdXNpbmcgQUVTLTEyOC1HQ00uDQo+ID4gKyAqDQo+ID4g
KyAqIFRoZSBCRUsgaXRzZWxmIGlzIGVuY3J5cHRlZCB1c2luZyB0aGUgaGFyZHdhcmUtYm91bmQg
a2V5IHVzaW5nIHRoZQ0KPiA+ICtEQ1AncyBBRVMNCj4gPiArICogZW5jcnlwdGlvbiBlbmdpbmUg
d2l0aCBBRVMtMTI4LUVDQi4gVGhlIGVuY3J5cHRlZCBCRUssIGdlbmVyYXRlZA0KPiA+ICtub25j
ZSwNCj4gPiArICogQkVLLWVuY3J5cHRlZCBwYXlsb2FkIGFuZCBhdXRoZW50aWNhdGlvbiB0YWcg
bWFrZSB1cCB0aGUgYmxvYg0KPiA+ICtmb3JtYXQgdG9nZXRoZXINCj4gPiArICogd2l0aCBhIHZl
cnNpb24gbnVtYmVyLCBwYXlsb2FkIGxlbmd0aCBhbmQgYXV0aGVudGljYXRpb24gdGFnLg0KPiA+
ICsgKi8NCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiBzdHJ1Y3QgZGNwX2Jsb2JfZm10IC0gRENQ
IEJMT0IgZm9ybWF0Lg0KPiA+ICAgKg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphcmtrbyBTYWtraW5l
biA8amFya2tvQGtlcm5lbC5vcmc+DQo+IA0KPiBJIGNhbiBvbmx5IHRlc3QgdGhhdCB0aGlzIGRv
ZXMgbm90IGJyZWFrIGEgbWFjaGluZSB3aXRob3V0IHRoZSBoYXJkd2FyZQ0KPiBmZWF0dXJlLg0K
PiANCj4gSXMgdGhlcmUgYW55b25lIHdobyBjb3VsZCBwb3NzaWJseSBwZWVyIHRlc3QgdGhlc2Ug
cGF0Y2hlcz8NCkkgYW0gYWxyZWFkeSB3b3JraW5nIG9uIHRlc3RpbmcgdGhpcyBwYXRjaHNldCBv
biBpLk1YNiBwbGF0Zm9ybS4NClJlZ2FyZHMsDQpLc2hpdGl6DQo+IEJSLCBKYXJra28NCg0K

