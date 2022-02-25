Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A884C44CD
	for <lists+linux-doc@lfdr.de>; Fri, 25 Feb 2022 13:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240676AbiBYMoH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Feb 2022 07:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiBYMoF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Feb 2022 07:44:05 -0500
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10055.outbound.protection.outlook.com [40.107.1.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F581A1C79;
        Fri, 25 Feb 2022 04:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtrwLsgrAsZXJGBjWoLiN08ka2ZkINZHs7Bqxot4k6DWyUdbSmthtkgY74+N4cbJss5b9VEVc/Po7h2QcZWzkLb1P1AJzBVZwhdwJS5IVRi9R2bLtmWpIm470iT0Wo/pz396pLRRxijvwnIMyogsTBRH3Mwd6D5ew31AkhMkwE+RUa4M/OrGCNAvVyGJbqXKUP7mZq4gQ3nu8kADdqG/jeekhOpX3JsjHuV19aKAfaYyr0SmC+34m/kTqldw8agwstIj8T1SJIcl832rRLs5mH09CGkcZ4byxH24Hkpr43TqdwdmoGXkQqu6f+FQsFIQIGtHqBthV5JY6G1I6PLuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRqNM+StOsVAf25vbAoT5kQWpmYtGQ6gxjb4gREwTxs=;
 b=YQg2SWyqPK5J5ETgbqR/MCAnQejpopVjsLBGMG0xIuEaNDnJBShwL93tA8DhaEUThNFzAJHbyklcrg57TVmJJiMa6P+WYBrv2yJ9G/IjDbIn0Pw2ye0R1AvzurAKLMsozunPykEG4Do5uYXvibDFEzqHG7xFip2JAddrk5RaEaKSlA5SK4IyMFrfvIsEgEzuz9CNuges/fmJZAl/32UWua9o27zjaXTQZcw/7p2gMBYT3nLCeqjnLV+qXJVifUVro6nmq4wpT3p4wWew8SICOY6QAPJHzMMNi72FDyudH4mi97HE71Iw/nMQ0SO3O+ajJRJwwQATROMVoJRKsayZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRqNM+StOsVAf25vbAoT5kQWpmYtGQ6gxjb4gREwTxs=;
 b=Iv2CASfUyk/4XJ8EwMBs5sj+DhHnoB6ZiOTPiCZO9aE2Lm0F3xeOlx4wEQ8IMlT+JAHTkvdwH0zZqkRaGQLKdqgUCfnmjPgeiPxa2wg7RGx5oFdURtUk4Dw+0/XOqXD2EMgzMU93iK9A2aK0a0l3xRklxwmmcXiVZDG6p6dsA44=
Received: from DU2PR04MB8630.eurprd04.prod.outlook.com (2603:10a6:10:2dd::15)
 by AM6PR04MB4278.eurprd04.prod.outlook.com (2603:10a6:209:4f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 12:43:27 +0000
Received: from DU2PR04MB8630.eurprd04.prod.outlook.com
 ([fe80::f92e:7648:49d2:d017]) by DU2PR04MB8630.eurprd04.prod.outlook.com
 ([fe80::f92e:7648:49d2:d017%5]) with mapi id 15.20.5017.024; Fri, 25 Feb 2022
 12:43:27 +0000
From:   Pankaj Gupta <pankaj.gupta@nxp.com>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James Bottomley <jejb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        David Gstir <david@sigma-star.at>,
        "tharvey@gateworks.com" <tharvey@gateworks.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>,
        Jan Luebbe <j.luebbe@pengutronix.de>,
        Richard Weinberger <richard@nod.at>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>
Subject: RE: [EXT] [PATCH v5 5/5] KEYS: trusted: Introduce support for NXP
 CAAM-based trusted keys
Thread-Topic: [EXT] [PATCH v5 5/5] KEYS: trusted: Introduce support for NXP
 CAAM-based trusted keys
Thread-Index: AQHYKCatrr/gyjsXVk+FLAE2AMGQvKykOZiw
Date:   Fri, 25 Feb 2022 12:43:27 +0000
Message-ID: <DU2PR04MB8630A1C8D343C3B4EBA7314B953E9@DU2PR04MB8630.eurprd04.prod.outlook.com>
References: <20220222195819.2313913-1-a.fatoum@pengutronix.de>
 <20220222195819.2313913-6-a.fatoum@pengutronix.de>
In-Reply-To: <20220222195819.2313913-6-a.fatoum@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf05e7b3-b8f6-4d87-6b71-08d9f85c6bc7
x-ms-traffictypediagnostic: AM6PR04MB4278:EE_
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM6PR04MB427867E691DF72A033544255953E9@AM6PR04MB4278.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KBtuwoykevG6J6Jqjo6c4EoV7QbGQwR3s7bic9J27nr65EYBDilwsrjXpHkASgh0R0LodIHyoS/R6NK/S/+2c9YSt9lP8vS9rcvprPU2lVCRqHyW0AvJs3tOF9YgJ57xICfzeY3uqnl+g2CcWYKm8zbx1n1KlAN0FUAfWMpKJWOF7LI/JImku97YwddUPOap+OICq8Hu8PR4UgoqUwxJfBsvTbfVNaAj+tzFDUK1H6igQ+mGgAZuEvFkyN3kN/+iPBqcJdqhhfj4AzwJdgnzGVEa5U8XTiwOg8vGRQrwDrrPITctWg3NhEZjRvqjE1bIrt7xgPEZAgJfAMSfhy8ma0CVXOE2Rval3TjP16mpqbKH/XwD5rbco2iHi3GoSteK6/XnEvNKFMMpnecb4fDUHoUamV7InpeUitVXOrp53pCnyuiBN9ropUljlrvVofwr8dIgTiYPfsGuPdX0EQWXzfB5IxO2GWZB2k6Yn8dpbORQbucHXlDs6HGR/WcM9cLgZ1nN/8OtuLXjBuKqmNWnwC49GcvUSTt8sRJ6jdBUctV5O/HHcNnPqGeBBB+DOSkf3sbM6hq4wZOBbCFgPIxPjdMatZuChRYm5sTnMn+qpzbhfJ2STIaoXifK1fmBpoJeWJAimELlpsiGeUk70iIbUwh8z4tO/4c6OySbdqFXankBCTBd9V5X23FfnkdZXcutgTulneq0d5nNrTGLAKdg2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(30864003)(7416002)(5660300002)(8936002)(83380400001)(44832011)(26005)(186003)(110136005)(52536014)(316002)(54906003)(55016003)(53546011)(71200400001)(38070700005)(7696005)(6506007)(2906002)(33656002)(64756008)(66476007)(4326008)(66946007)(66556008)(8676002)(508600001)(66446008)(122000001)(76116006)(38100700002)(86362001)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnZpeThWZmNEaHo4ekFnMVpnK3B0Z054cFJld3JOd1d0T2pHYVRTaTNTbjln?=
 =?utf-8?B?Q0V4c2J0TTNtZzIxWWdJd1k5V2NqYVpvRkFVb2tmdUZqUlJSUVlIUDlDUk1Q?=
 =?utf-8?B?NXJiaEpFUXFUc3pZNTMrZURIc3gyVHhNdWE5bHNod0VLVGpOTWIyc1YxcFcy?=
 =?utf-8?B?UFQrMDIyMGVKZ1F4bU12S211MG5lWm9TN1ArMWhvcVorV290a3l2MXFTYmpG?=
 =?utf-8?B?YU9FYkY3OVVGVHRuaExBVEJhQWFETTY5U3VyRVdteFNrTUtuaHNuNzlhcGVP?=
 =?utf-8?B?SEtsbFZyVDJpL1JBdWN3aE1ZUjFUZC9lZEtFVGZ2ODJQbkFCN1dkNkp0K2k3?=
 =?utf-8?B?MGE2YjA3bExsMDZER2V5cjBOaXZwMnJTU0ZMRWZqcEIzTGpPQWthNklKUlJk?=
 =?utf-8?B?RlN5TTlSV0s4NCtDamlqVG91MmdxMDVIRkRqZ01sYU56N1pBemZZcy9od2dL?=
 =?utf-8?B?dUNmVjlzRmRlbHNpdXZKNVE2Ky9XeXV5dkttYmNrZHZ5TmlmRUczaTNJd1hw?=
 =?utf-8?B?RERPbm04elRXb3NWaGxxblcwbU95aE12L1BrZ2UxT25BNXliQ2tSZk5BMk5s?=
 =?utf-8?B?ZFpuak1UY0VzVENPRVI5WktYSGcwTjVxeFY5cmZoVUNDUDZ0dlkzb3p3YzE0?=
 =?utf-8?B?TVhFS3VOVDZtMmwyaFhSMEpkMCtnUU9uK09WN1JwQWhvN0Y2d2Ztc295bEhw?=
 =?utf-8?B?TTFDWlNrdUxEYUZiVnNDRGR0WU85ZGZ6dDM5UGhzUDdkTGR3OFR1NFY0TmFk?=
 =?utf-8?B?WjIxcCtMYm5VL0cxdUN5VkZJbjkxb3B3ZkozZXNRT3o3ajJlOUp6RWtMK1JP?=
 =?utf-8?B?Umw0elY2bmc1T1JNOU9iUC9GN1cyVG5zbVBnUEpjalRjLzVxejJWcHlnL2Ux?=
 =?utf-8?B?TzRQRTRvbHdHdkkxWlRqZS8vRzg5d2VONkhvUGRpODQ1ZldnVWsrMGROTWJF?=
 =?utf-8?B?M1JlNitSR2RRZkJhWHZzejdqVVdmM0hqbkRCVnhFMTRHWG9LV2srV0xjNEVy?=
 =?utf-8?B?RjNvT2ZZTUxlQU5OQUM2SDNoS3E0UE9hMXh3M2lINWZnM0ZKcXJvYVJndWwx?=
 =?utf-8?B?eDltUGlzVkZrR25YU1hHNEp1TVRvM1BzSW5MYXhIM1ovRnJ5OHJCaHFpSmg3?=
 =?utf-8?B?enFzQk0reXNGbmxDbFU4QzZJcVJYQXZPVXl6R1FKRE1PYVFuT2lTZXR2RjZG?=
 =?utf-8?B?OFFRSWFyenlEWU5wZE9UcGh3ZU9yRHRFaDl3MHZOTkVpT0tOVFVjbmNPZUVs?=
 =?utf-8?B?bWtMck1nbjlWdUhDbjFnTTMyRVZNaGZ1UGk4VHB1bWVVK1lCMHBZU2xxaEhM?=
 =?utf-8?B?OU9MRDI5ODdqeVQyUDRJL0VYRWM3cGpNaWtJSER3ZmxMWEVKd2ZMbmlIa1h6?=
 =?utf-8?B?Vnl5a2pkNFVycGJpTy83dFV4RnhhWW9xZFlBb09kdjFFK0VxSVpwZXhkY296?=
 =?utf-8?B?Wmt1SkEwMVBuRnJ6MUUvVXhhT2dIQjRZVzFxVU9ZUDNUL2xkdllRTzhRTlFQ?=
 =?utf-8?B?VDg0UllKa1huTHRYMEE3ckRiQUxDQ1pvZFFzQldiK3l3SmsveU5oZlcvZVFB?=
 =?utf-8?B?Mk90bzFHcXRZNXVmN3pLT0RvbEdCcjlrWGZZT3QwV3drNUxBS2twMGZkNVBM?=
 =?utf-8?B?WGtleWxrS0ZwckE4Vnh5ZU14Mng2N3VhaWcxeVFyYU9kSzhZcEZNZVlIRUFX?=
 =?utf-8?B?MFpUNEJlUXpnVkhxdW5ycGtNOUhvQ2ZGemF1WnozdE94QXAvK3QxLzNJZ2dO?=
 =?utf-8?B?Uk1sSE1RYUJFRFdVeDlReUxkOXBpY2hwWXN2STY2b2tMc1Zsc0dIZm9OY0pu?=
 =?utf-8?B?QjlIQ0ZxdnlKYm5yMlEyK3Z5U2E3ZGV6MFJ2YzN5Nk9UV1hzWlFlK0YzYXo0?=
 =?utf-8?B?eXE1eUdIR0UyTXVySXp3NWEyMHROM3B5QlF5dFZrekZoeGVlaEZWcnRGYzhi?=
 =?utf-8?B?ZUQrbmNwQ0Q1VWpjZDd2NFRaOUJiQXA1VTBRTlp6d2F3bTFHZi82YjRHMmVK?=
 =?utf-8?B?S2dJeE13NmJuWVZYQUJtV2J6VHl2dzgxUGQxVjdQOVhCbnBUZmhraXppdk5l?=
 =?utf-8?B?OXMwTFdJKzJ5ZGhFL0dGSzBLMDRVWWVZZzlLbzR3R0VwT2dsVUZpQzZqZlVH?=
 =?utf-8?B?MzVHaTFibWRBTm96STk2RzVMZzBXV3BHRmloaUhUSGFrTnkvcUt3OXM5d2tP?=
 =?utf-8?Q?7ih+8mZ85OtrtHmpeuQ2irg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf05e7b3-b8f6-4d87-6b71-08d9f85c6bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 12:43:27.6984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pb04dWgo7TWR6TgnyFoYgeuvXO9ng59fDxzqFYLPhHDJnV0RN0uf6oMjxZzST35CabXJl5PPJi1Ayy8GxecIUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4278
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IFBhbmthaiBHdXB0YSA8cGFua2FqLmd1cHRhQG54cC5jb20+DQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBw
ZW5ndXRyb25peC5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMywgMjAyMiAxOjI4
IEFNDQo+IFRvOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgRGF2aWQgSG93ZWxs
cw0KPiA8ZGhvd2VsbHNAcmVkaGF0LmNvbT47IEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtlcm5l
bC5vcmc+OyBKYW1lcw0KPiBCb3R0b21sZXkgPGplamJAbGludXguaWJtLmNvbT47IE1pbWkgWm9o
YXIgPHpvaGFyQGxpbnV4LmlibS5jb20+DQo+IENjOiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IERh
dmlkIEdzdGlyIDxkYXZpZEBzaWdtYS1zdGFyLmF0PjsNCj4gdGhhcnZleUBnYXRld29ya3MuY29t
OyBNYXR0aGlhcyBTY2hpZmZlciA8bWF0dGhpYXMuc2NoaWZmZXJAZXcudHEtDQo+IGdyb3VwLmNv
bT47IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+OyBKYW1lcyBNb3JyaXMN
Cj4gPGptb3JyaXNAbmFtZWkub3JnPjsgU2VyZ2UgRS4gSGFsbHluIDxzZXJnZUBoYWxseW4uY29t
PjsgSG9yaWEgR2VhbnRhDQo+IDxob3JpYS5nZWFudGFAbnhwLmNvbT47IEF5bWVuIFNnaGFpZXIg
PGF5bWVuLnNnaGFpZXJAbnhwLmNvbT47IEhlcmJlcnQNCj4gWHUgPGhlcmJlcnRAZ29uZG9yLmFw
YW5hLm9yZy5hdT47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47DQo+IEVy
aWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz47IEphbiBMdWViYmUgPGoubHVlYmJlQHBl
bmd1dHJvbml4LmRlPjsNCj4gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD47IEZy
YW5jayBMZW5vcm1hbmQNCj4gPGZyYW5jay5sZW5vcm1hbmRAbnhwLmNvbT47IFN1bWl0IEdhcmcg
PHN1bWl0LmdhcmdAbGluYXJvLm9yZz47IFBhbmthag0KPiBHdXB0YSA8cGFua2FqLmd1cHRhQG54
cC5jb20+OyBrZXlyaW5nc0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBjcnlwdG9Admdlci5r
ZXJuZWwub3JnOyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gaW50ZWdyaXR5
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtc2Vj
dXJpdHktDQo+IG1vZHVsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW0VYVF0gW1BBVENI
IHY1IDUvNV0gS0VZUzogdHJ1c3RlZDogSW50cm9kdWNlIHN1cHBvcnQgZm9yIE5YUCBDQUFNLQ0K
PiBiYXNlZCB0cnVzdGVkIGtleXMNCj4gDQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gVGhl
IENyeXB0b2dyYXBoaWMgQWNjZWxlcmF0aW9uIGFuZCBBc3N1cmFuY2UgTW9kdWxlIChDQUFNKSBp
cyBhbiBJUCBjb3JlIGJ1aWx0DQo+IGludG8gbWFueSBuZXdlciBpLk1YIGFuZCBRb3JJUSBTb0Nz
IGJ5IE5YUC4NCj4gDQo+IFRoZSBDQUFNIGRvZXMgY3J5cHRvIGFjY2VsZXJhdGlvbiwgaGFyZHdh
cmUgbnVtYmVyIGdlbmVyYXRpb24gYW5kIGhhcyBhDQo+IGJsb2IgbWVjaGFuaXNtIGZvciBlbmNh
cHN1bGF0aW9uL2RlY2Fwc3VsYXRpb24gb2Ygc2Vuc2l0aXZlIG1hdGVyaWFsLg0KPiANCj4gVGhp
cyBibG9iIG1lY2hhbmlzbSBkZXBlbmRzIG9uIGEgZGV2aWNlIHNwZWNpZmljIHJhbmRvbSAyNTYt
Yml0IE9uZSBUaW1lDQo+IFByb2dyYW1tYWJsZSBNYXN0ZXIgS2V5IHRoYXQgaXMgZnVzZWQgaW4g
ZWFjaCBTb0MgYXQgbWFudWZhY3R1cmluZyB0aW1lLiBUaGlzDQo+IGtleSBpcyB1bnJlYWRhYmxl
IGFuZCBjYW4gb25seSBiZSB1c2VkIGJ5IHRoZSBDQUFNIGZvciBBRVMNCj4gZW5jcnlwdGlvbi9k
ZWNyeXB0aW9uIG9mIHVzZXIgZGF0YS4NCj4gDQo+IFRoaXMgbWFrZXMgaXQgYSBzdWl0YWJsZSBi
YWNrZW5kIChzb3VyY2UpIGZvciBrZXJuZWwgdHJ1c3RlZCBrZXlzLg0KPiANCj4gUHJldmlvdXMg
Y29tbWl0cyBnZW5lcmFsaXplZCB0cnVzdGVkIGtleXMgdG8gc3VwcG9ydCBtdWx0aXBsZSBiYWNr
ZW5kcyBhbmQNCj4gYWRkZWQgYW4gQVBJIHRvIGFjY2VzcyB0aGUgQ0FBTSBibG9iIG1lY2hhbmlz
bS4gQmFzZWQgb24gdGhlc2UsIHByb3ZpZGUgdGhlDQo+IG5lY2Vzc2FyeSBnbHVlIHRvIHVzZSB0
aGUgQ0FBTSBmb3IgdHJ1c3RlZCBrZXlzLg0KPiANCj4gUmV2aWV3ZWQtYnk6IERhdmlkIEdzdGly
IDxkYXZpZEBzaWdtYS1zdGFyLmF0Pg0KPiBUZXN0ZWQtQnk6IFRpbSBIYXJ2ZXkgPHRoYXJ2ZXlA
Z2F0ZXdvcmtzLmNvbT4NCj4gVGVzdGVkLWJ5OiBNYXR0aGlhcyBTY2hpZmZlciA8bWF0dGhpYXMu
c2NoaWZmZXJAZXcudHEtZ3JvdXAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBaG1hZCBGYXRvdW0g
PGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gVG86IEpvbmF0aGFuIENvcmJldCA8
Y29yYmV0QGx3bi5uZXQ+DQo+IFRvOiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQuY29t
Pg0KPiBUbzogSmFya2tvIFNha2tpbmVuIDxqYXJra29Aa2VybmVsLm9yZz4NCj4gVG86IEphbWVz
IEJvdHRvbWxleSA8amVqYkBsaW51eC5pYm0uY29tPg0KPiBUbzogTWltaSBab2hhciA8em9oYXJA
bGludXguaWJtLmNvbT4NCj4gQ2M6IEphbWVzIE1vcnJpcyA8am1vcnJpc0BuYW1laS5vcmc+DQo+
IENjOiAiU2VyZ2UgRS4gSGFsbHluIiA8c2VyZ2VAaGFsbHluLmNvbT4NCj4gQ2M6ICJIb3JpYSBH
ZWFudMSDIiA8aG9yaWEuZ2VhbnRhQG54cC5jb20+DQo+IENjOiBBeW1lbiBTZ2hhaWVyIDxheW1l
bi5zZ2hhaWVyQG54cC5jb20+DQo+IENjOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFu
YS5vcmcuYXU+DQo+IENjOiAiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4N
Cj4gQ2M6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4NCj4gQ2M6IEphbiBMdWVi
YmUgPGoubHVlYmJlQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogRGF2aWQgR3N0aXIgPGRhdmlkQHNp
Z21hLXN0YXIuYXQ+DQo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pg0K
PiBDYzogRnJhbmNrIExFTk9STUFORCA8ZnJhbmNrLmxlbm9ybWFuZEBueHAuY29tPg0KPiBDYzog
U3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPg0KPiBDYzogVGltIEhhcnZleSA8dGhh
cnZleUBnYXRld29ya3MuY29tPg0KPiBDYzogTWF0dGhpYXMgU2NoaWZmZXIgPG1hdHRoaWFzLnNj
aGlmZmVyQGV3LnRxLWdyb3VwLmNvbT4NCj4gQ2M6IFBhbmthaiBHdXB0YSA8cGFua2FqLmd1cHRh
QG54cC5jb20+DQo+IENjOiBrZXlyaW5nc0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWNy
eXB0b0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCj4g
Q2M6IGxpbnV4LWludGVncml0eUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LXNlY3VyaXR5LW1vZHVsZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gLS0tDQo+ICAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAg
ICAgfCAgMSArDQo+ICAuLi4vc2VjdXJpdHkva2V5cy90cnVzdGVkLWVuY3J5cHRlZC5yc3QgICAg
ICAgfCA0MCArKysrKysrKystDQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgOSArKysNCj4gIGluY2x1ZGUva2V5cy90cnVzdGVkX2NhYW0uaCAgICAg
ICAgICAgICAgICAgICB8IDExICsrKw0KPiAgc2VjdXJpdHkva2V5cy90cnVzdGVkLWtleXMvS2Nv
bmZpZyAgICAgICAgICAgIHwgMTEgKystDQo+ICBzZWN1cml0eS9rZXlzL3RydXN0ZWQta2V5cy9N
YWtlZmlsZSAgICAgICAgICAgfCAgMiArDQo+ICBzZWN1cml0eS9rZXlzL3RydXN0ZWQta2V5cy90
cnVzdGVkX2NhYW0uYyAgICAgfCA3NCArKysrKysrKysrKysrKysrKysrDQo+ICBzZWN1cml0eS9r
ZXlzL3RydXN0ZWQta2V5cy90cnVzdGVkX2NvcmUuYyAgICAgfCAgNiArLQ0KPiAgOCBmaWxlcyBj
aGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiBpbmNsdWRlL2tleXMvdHJ1c3RlZF9jYWFtLmggIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
ZWN1cml0eS9rZXlzL3RydXN0ZWQtDQo+IGtleXMvdHJ1c3RlZF9jYWFtLmMNCj4gDQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0K
PiBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0DQo+IGlu
ZGV4IDg0NGM4ODNjYTlkOC4uOWU3ZWY0YzY1ODVkIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiBAQCAtNTg3NSw2ICs1ODc1
LDcgQEANCj4gICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlczoNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgLSAidHBtIg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAtICJ0ZWUiDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIC0gImNhYW0iDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIElmIG5vdCBzcGVjaWZpZWQgdGhlbiBpdCBkZWZhdWx0cyB0byBpdGVyYXRpbmcgdGhyb3Vn
aA0KPiAgICAgICAgICAgICAgICAgICAgICAgICB0aGUgdHJ1c3Qgc291cmNlIGxpc3Qgc3RhcnRp
bmcgd2l0aCBUUE0gYW5kIGFzc2lnbnMgdGhlDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGZp
cnN0IHRydXN0IHNvdXJjZSBhcyBhIGJhY2tlbmQgd2hpY2ggaXMgaW5pdGlhbGl6ZWQgZGlmZiAt
LWdpdA0KPiBhL0RvY3VtZW50YXRpb24vc2VjdXJpdHkva2V5cy90cnVzdGVkLWVuY3J5cHRlZC5y
c3QNCj4gYi9Eb2N1bWVudGF0aW9uL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1lbmNyeXB0ZWQucnN0
DQo+IGluZGV4IDk5Y2YzNGQ3YzAyNS4uZWQ2MGM0OGNiNjkyIDEwMDY0NA0KPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1lbmNyeXB0ZWQucnN0DQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vc2VjdXJpdHkva2V5cy90cnVzdGVkLWVuY3J5cHRlZC5yc3QNCj4gQEAgLTM1
LDYgKzM1LDEzIEBAIHNhZmUuDQo+ICAgICAgICAgICBSb290ZWQgdG8gSGFyZHdhcmUgVW5pcXVl
IEtleSAoSFVLKSB3aGljaCBpcyBnZW5lcmFsbHkgYnVybnQgaW4gb24tY2hpcA0KPiAgICAgICAg
ICAgZnVzZXMgYW5kIGlzIGFjY2Vzc2libGUgdG8gVEVFIG9ubHkuDQo+IA0KPiArICAgICAoMykg
Q0FBTSAoQ3J5cHRvZ3JhcGhpYyBBY2NlbGVyYXRpb24gYW5kIEFzc3VyYW5jZSBNb2R1bGU6IElQ
IG9uDQo+ICsgTlhQIFNvQ3MpDQo+ICsNCj4gKyAgICAgICAgIFdoZW4gSGlnaCBBc3N1cmFuY2Ug
Qm9vdCAoSEFCKSBpcyBlbmFibGVkIGFuZCB0aGUgQ0FBTSBpcyBpbiBzZWN1cmUNCj4gKyAgICAg
ICAgIG1vZGUsIHRydXN0IGlzIHJvb3RlZCB0byB0aGUgT1RQTUssIGEgbmV2ZXItZGlzY2xvc2Vk
IDI1Ni1iaXQga2V5DQo+ICsgICAgICAgICByYW5kb21seSBnZW5lcmF0ZWQgYW5kIGZ1c2VkIGlu
dG8gZWFjaCBTb0MgYXQgbWFudWZhY3R1cmluZyB0aW1lLg0KPiArICAgICAgICAgT3RoZXJ3aXNl
LCBhIGNvbW1vbiBmaXhlZCB0ZXN0IGtleSBpcyB1c2VkIGluc3RlYWQuDQo+ICsNCj4gICAgKiAg
RXhlY3V0aW9uIGlzb2xhdGlvbg0KPiANCj4gICAgICAgKDEpIFRQTQ0KPiBAQCAtNDYsNiArNTMs
MTAgQEAgc2FmZS4NCj4gICAgICAgICAgIEN1c3RvbWl6YWJsZSBzZXQgb2Ygb3BlcmF0aW9ucyBy
dW5uaW5nIGluIGlzb2xhdGVkIGV4ZWN1dGlvbg0KPiAgICAgICAgICAgZW52aXJvbm1lbnQgdmVy
aWZpZWQgdmlhIFNlY3VyZS9UcnVzdGVkIGJvb3QgcHJvY2Vzcy4NCj4gDQo+ICsgICAgICgzKSBD
QUFNDQo+ICsNCj4gKyAgICAgICAgIEZpeGVkIHNldCBvZiBvcGVyYXRpb25zIHJ1bm5pbmcgaW4g
aXNvbGF0ZWQgZXhlY3V0aW9uIGVudmlyb25tZW50Lg0KPiArDQo+ICAgICogT3B0aW9uYWwgYmlu
ZGluZyB0byBwbGF0Zm9ybSBpbnRlZ3JpdHkgc3RhdGUNCj4gDQo+ICAgICAgICgxKSBUUE0NCj4g
QEAgLTYzLDYgKzc0LDExIEBAIHNhZmUuDQo+ICAgICAgICAgICBSZWxpZXMgb24gU2VjdXJlL1Ry
dXN0ZWQgYm9vdCBwcm9jZXNzIGZvciBwbGF0Zm9ybSBpbnRlZ3JpdHkuIEl0IGNhbg0KPiAgICAg
ICAgICAgYmUgZXh0ZW5kZWQgd2l0aCBURUUgYmFzZWQgbWVhc3VyZWQgYm9vdCBwcm9jZXNzLg0K
PiANCj4gKyAgICAgKDMpIENBQU0NCj4gKw0KPiArICAgICAgICAgUmVsaWVzIG9uIHRoZSBIaWdo
IEFzc3VyYW5jZSBCb290IChIQUIpIG1lY2hhbmlzbSBvZiBOWFAgU29Dcw0KPiArICAgICAgICAg
Zm9yIHBsYXRmb3JtIGludGVncml0eS4NCj4gKw0KPiAgICAqICBJbnRlcmZhY2VzIGFuZCBBUElz
DQo+IA0KPiAgICAgICAoMSkgVFBNDQo+IEBAIC03NCwxMCArOTAsMTMgQEAgc2FmZS4NCj4gICAg
ICAgICAgIFRFRXMgaGF2ZSB3ZWxsLWRvY3VtZW50ZWQsIHN0YW5kYXJkaXplZCBjbGllbnQgaW50
ZXJmYWNlIGFuZCBBUElzLiBGb3INCj4gICAgICAgICAgIG1vcmUgZGV0YWlscyByZWZlciB0byBg
YERvY3VtZW50YXRpb24vc3RhZ2luZy90ZWUucnN0YGAuDQo+IA0KPiArICAgICAoMykgQ0FBTQ0K
PiArDQo+ICsgICAgICAgICBJbnRlcmZhY2UgaXMgc3BlY2lmaWMgdG8gc2lsaWNvbiB2ZW5kb3Iu
DQo+IA0KPiAgICAqICBUaHJlYXQgbW9kZWwNCj4gDQo+IC0gICAgIFRoZSBzdHJlbmd0aCBhbmQg
YXBwcm9wcmlhdGVuZXNzIG9mIGEgcGFydGljdWxhciBUUE0gb3IgVEVFIGZvciBhIGdpdmVuDQo+
ICsgICAgIFRoZSBzdHJlbmd0aCBhbmQgYXBwcm9wcmlhdGVuZXNzIG9mIGEgcGFydGljdWxhciB0
cnVzdCBzb3VyY2UgZm9yDQo+ICsgYSBnaXZlbg0KPiAgICAgICBwdXJwb3NlIG11c3QgYmUgYXNz
ZXNzZWQgd2hlbiB1c2luZyB0aGVtIHRvIHByb3RlY3Qgc2VjdXJpdHktcmVsZXZhbnQgZGF0YS4N
Cj4gDQo+IA0KPiBAQCAtMTA0LDYgKzEyMywxMiBAQCBzZWxlY3RlZCB0cnVzdCBzb3VyY2U6DQo+
ICAgICAgIGZyb20gcGxhdGZvcm0gc3BlY2lmaWMgaGFyZHdhcmUgUk5HIG9yIGEgc29mdHdhcmUg
YmFzZWQgRm9ydHVuYSBDU1BSTkcNCj4gICAgICAgd2hpY2ggY2FuIGJlIHNlZWRlZCB2aWEgbXVs
dGlwbGUgZW50cm9weSBzb3VyY2VzLg0KPiANCj4gKyAgKiAgQ0FBTTogS2VybmVsIFJORw0KPiAr
DQo+ICsgICAgIFRoZSBub3JtYWwga2VybmVsIHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yIGlzIHVz
ZWQuIFRvIHNlZWQgaXQgZnJvbSB0aGUNCj4gKyAgICAgQ0FBTSBIV1JORywgZW5hYmxlIENSWVBU
T19ERVZfRlNMX0NBQU1fUk5HX0FQSSBhbmQgZW5zdXJlIHRoZQ0KPiBkZXZpY2UNCj4gKyAgICAg
aXMgcHJvYmVkLg0KPiArDQo+ICBVc2VycyBtYXkgb3ZlcnJpZGUgdGhpcyBieSBzcGVjaWZ5aW5n
IGBgdHJ1c3RlZC5ybmc9a2VybmVsYGAgb24gdGhlIGtlcm5lbA0KPiBjb21tYW5kLWxpbmUgdG8g
b3ZlcnJpZGUgdGhlIHVzZWQgUk5HIHdpdGggdGhlIGtlcm5lbCdzIHJhbmRvbSBudW1iZXIgcG9v
bC4NCj4gDQo+IEBAIC0xOTIsNiArMjE3LDE5IEBAIFVzYWdlOjoNCj4gIHNwZWNpZmljIHRvIFRF
RSBkZXZpY2UgaW1wbGVtZW50YXRpb24uICBUaGUga2V5IGxlbmd0aCBmb3IgbmV3IGtleXMgaXMg
YWx3YXlzICBpbg0KPiBieXRlcy4gVHJ1c3RlZCBLZXlzIGNhbiBiZSAzMiAtIDEyOCBieXRlcyAo
MjU2IC0gMTAyNCBiaXRzKS4NCj4gDQo+ICtUcnVzdGVkIEtleXMgdXNhZ2U6IENBQU0NCj4gKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICtVc2FnZTo6DQo+ICsNCj4gKyAgICBrZXlj
dGwgYWRkIHRydXN0ZWQgbmFtZSAibmV3IGtleWxlbiIgcmluZw0KPiArICAgIGtleWN0bCBhZGQg
dHJ1c3RlZCBuYW1lICJsb2FkIGhleF9ibG9iIiByaW5nDQo+ICsgICAga2V5Y3RsIHByaW50IGtl
eWlkDQo+ICsNCj4gKyJrZXljdGwgcHJpbnQiIHJldHVybnMgYW4gQVNDSUkgaGV4IGNvcHkgb2Yg
dGhlIHNlYWxlZCBrZXksIHdoaWNoIGlzIGluDQo+ICtmb3JtYXQgc3BlY2lmaWMgdG8gQ0FBTSBk
ZXZpY2UgaW1wbGVtZW50YXRpb24uICBUaGUga2V5IGxlbmd0aCBmb3IgbmV3DQo+ICtrZXlzIGlz
IGFsd2F5cyBpbiBieXRlcy4gVHJ1c3RlZCBLZXlzIGNhbiBiZSAzMiAtIDEyOCBieXRlcyAoMjU2
IC0gMTAyNCBiaXRzKS4NCj4gKw0KPiAgRW5jcnlwdGVkIEtleXMgdXNhZ2UNCj4gIC0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
Uw0KPiBpbmRleCBmNjcwMDAyMTM0ZTAuLjZlY2E0NDc2YmI3NiAxMDA2NDQNCj4gLS0tIGEvTUFJ
TlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTEwNjU1LDYgKzEwNjU1LDE1IEBA
IFM6ICAgICBTdXBwb3J0ZWQNCj4gIEY6ICAgICBpbmNsdWRlL2tleXMvdHJ1c3RlZF90ZWUuaA0K
PiAgRjogICAgIHNlY3VyaXR5L2tleXMvdHJ1c3RlZC1rZXlzL3RydXN0ZWRfdGVlLmMNCj4gDQo+
ICtLRVlTLVRSVVNURUQtQ0FBTQ0KPiArTTogICAgIEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVu
Z3V0cm9uaXguZGU+DQo+ICtSOiAgICAgUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBw
ZW5ndXRyb25peC5kZT4NCj4gK0w6ICAgICBsaW51eC1pbnRlZ3JpdHlAdmdlci5rZXJuZWwub3Jn
DQo+ICtMOiAgICAga2V5cmluZ3NAdmdlci5rZXJuZWwub3JnDQo+ICtTOiAgICAgTWFpbnRhaW5l
ZA0KPiArRjogICAgIGluY2x1ZGUva2V5cy90cnVzdGVkX2NhYW0uaA0KPiArRjogICAgIHNlY3Vy
aXR5L2tleXMvdHJ1c3RlZC1rZXlzL3RydXN0ZWRfY2FhbS5jDQo+ICsNCj4gIEtFWVMvS0VZUklO
R1MNCj4gIE06ICAgICBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQuY29tPg0KPiAgTTog
ICAgIEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtlcm5lbC5vcmc+DQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2tleXMvdHJ1c3RlZF9jYWFtLmggYi9pbmNsdWRlL2tleXMvdHJ1c3RlZF9jYWFtLmgg
bmV3IGZpbGUNCj4gbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi4yZmJhMDk5NmIwYjAN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9pbmNsdWRlL2tleXMvdHJ1c3RlZF9jYWFtLmgNCj4g
QEAgLTAsMCArMSwxMSBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBQZW5ndXRyb25peCwgQWht
YWQgRmF0b3VtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+ICsqLw0KPiArDQo+ICsjaWZuZGVm
IF9fQ0FBTV9UUlVTVEVEX0tFWV9IDQo+ICsjZGVmaW5lIF9fQ0FBTV9UUlVTVEVEX0tFWV9IDQo+
ICsNCj4gK2V4dGVybiBzdHJ1Y3QgdHJ1c3RlZF9rZXlfb3BzIGNhYW1fdHJ1c3RlZF9rZXlfb3Bz
Ow0KPiArDQo+ICsjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1r
ZXlzL0tjb25maWcgYi9zZWN1cml0eS9rZXlzL3RydXN0ZWQtDQo+IGtleXMvS2NvbmZpZw0KPiBp
bmRleCBmYzRhYmQ1ODFhYmIuLmRiZmRkODUzNjQ2OCAxMDA2NDQNCj4gLS0tIGEvc2VjdXJpdHkv
a2V5cy90cnVzdGVkLWtleXMvS2NvbmZpZw0KPiArKysgYi9zZWN1cml0eS9rZXlzL3RydXN0ZWQt
a2V5cy9LY29uZmlnDQo+IEBAIC0yNCw2ICsyNCwxNSBAQCBjb25maWcgVFJVU1RFRF9LRVlTX1RF
RQ0KPiAgICAgICAgICAgRW5hYmxlIHVzZSBvZiB0aGUgVHJ1c3RlZCBFeGVjdXRpb24gRW52aXJv
bm1lbnQgKFRFRSkgYXMgdHJ1c3RlZA0KPiAgICAgICAgICAga2V5IGJhY2tlbmQuDQo+IA0KPiAt
aWYgIVRSVVNURURfS0VZU19UUE0gJiYgIVRSVVNURURfS0VZU19URUUNCj4gK2NvbmZpZyBUUlVT
VEVEX0tFWVNfQ0FBTQ0KPiArICAgICAgIGJvb2wgIkNBQU0tYmFzZWQgdHJ1c3RlZCBrZXlzIg0K
PiArICAgICAgIGRlcGVuZHMgb24gQ1JZUFRPX0RFVl9GU0xfQ0FBTV9KUiA+PSBUUlVTVEVEX0tF
WVMNCj4gKyAgICAgICBzZWxlY3QgQ1JZUFRPX0RFVl9GU0xfQ0FBTV9CTE9CX0dFTg0KPiArICAg
ICAgIGRlZmF1bHQgeQ0KPiArICAgICAgIGhlbHANCj4gKyAgICAgICAgIEVuYWJsZSB1c2Ugb2Yg
TlhQJ3MgQ3J5cHRvZ3JhcGhpYyBBY2NlbGVyYXRvciBhbmQgQXNzdXJhbmNlIE1vZHVsZQ0KPiAr
ICAgICAgICAgKENBQU0pIGFzIHRydXN0ZWQga2V5IGJhY2tlbmQuDQo+ICsNCj4gK2lmICFUUlVT
VEVEX0tFWVNfVFBNICYmICFUUlVTVEVEX0tFWVNfVEVFICYmICFUUlVTVEVEX0tFWVNfQ0FBTQ0K
PiAgY29tbWVudCAiTm8gdHJ1c3Qgc291cmNlIHNlbGVjdGVkISINCj4gIGVuZGlmDQo+IGRpZmYg
LS1naXQgYS9zZWN1cml0eS9rZXlzL3RydXN0ZWQta2V5cy9NYWtlZmlsZSBiL3NlY3VyaXR5L2tl
eXMvdHJ1c3RlZC0NCj4ga2V5cy9NYWtlZmlsZQ0KPiBpbmRleCAyZTIzNzFlYWU0ZDUuLjczNWFh
MGJjMDhlZiAxMDA2NDQNCj4gLS0tIGEvc2VjdXJpdHkva2V5cy90cnVzdGVkLWtleXMvTWFrZWZp
bGUNCj4gKysrIGIvc2VjdXJpdHkva2V5cy90cnVzdGVkLWtleXMvTWFrZWZpbGUNCj4gQEAgLTEy
LDMgKzEyLDUgQEAgdHJ1c3RlZC0kKENPTkZJR19UUlVTVEVEX0tFWVNfVFBNKSArPQ0KPiB0cnVz
dGVkX3RwbTIubw0KPiAgdHJ1c3RlZC0kKENPTkZJR19UUlVTVEVEX0tFWVNfVFBNKSArPSB0cG0y
a2V5LmFzbjEubw0KPiANCj4gIHRydXN0ZWQtJChDT05GSUdfVFJVU1RFRF9LRVlTX1RFRSkgKz0g
dHJ1c3RlZF90ZWUubw0KPiArDQo+ICt0cnVzdGVkLSQoQ09ORklHX1RSVVNURURfS0VZU19DQUFN
KSArPSB0cnVzdGVkX2NhYW0ubw0KPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkva2V5cy90cnVzdGVk
LWtleXMvdHJ1c3RlZF9jYWFtLmMgYi9zZWN1cml0eS9rZXlzL3RydXN0ZWQtDQo+IGtleXMvdHJ1
c3RlZF9jYWFtLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAw
Li4wNjZmMDhkNmViMmMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9zZWN1cml0eS9rZXlzL3Ry
dXN0ZWQta2V5cy90cnVzdGVkX2NhYW0uYw0KPiBAQCAtMCwwICsxLDc0IEBADQo+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ICsvKg0KPiArICogQ29weXJpZ2h0
IChDKSAyMDIxIFBlbmd1dHJvbml4LCBBaG1hZCBGYXRvdW0gPGtlcm5lbEBwZW5ndXRyb25peC5k
ZT4NCj4gKyovDQo+ICsNCj4gKyNpbmNsdWRlIDxrZXlzL3RydXN0ZWRfY2FhbS5oPg0KPiArI2lu
Y2x1ZGUgPGtleXMvdHJ1c3RlZC10eXBlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvYnVpbGRfYnVn
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgva2V5LXR5cGUuaD4NCj4gKyNpbmNsdWRlIDxzb2MvZnNs
L2NhYW0tYmxvYi5oPg0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGNhYW1fYmxvYl9wcml2ICpibG9i
aWZpZXI7DQo+ICsNCj4gKyNkZWZpbmUgS0VZTU9EICJTRUNVUkVfS0VZIg0KPiArDQo+ICtzdGF0
aWNfYXNzZXJ0KE1BWF9LRVlfU0laRSArIENBQU1fQkxPQl9PVkVSSEVBRCA8PQ0KPiBDQUFNX0JM
T0JfTUFYX0xFTik7DQo+ICtzdGF0aWNfYXNzZXJ0KE1BWF9CTE9CX1NJWkUgPD0gQ0FBTV9CTE9C
X01BWF9MRU4pOw0KPiArDQo+ICtzdGF0aWMgaW50IHRydXN0ZWRfY2FhbV9zZWFsKHN0cnVjdCB0
cnVzdGVkX2tleV9wYXlsb2FkICpwLCBjaGFyDQo+ICsqZGF0YWJsb2IpIHsNCj4gKyAgICAgICBp
bnQgbGVuZ3RoID0gcC0+a2V5X2xlbiArIENBQU1fQkxPQl9PVkVSSEVBRDsNCj4gKyAgICAgICBp
bnQgcmV0Ow0KPiArDQo+ICsgICAgICAgcmV0ID0gY2FhbV9lbmNhcF9ibG9iKGJsb2JpZmllciwg
S0VZTU9ELCBwLT5rZXksIHAtPmJsb2IsIGxlbmd0aCk7DQo+ICsgICAgICAgaWYgKHJldCkNCj4g
KyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICsNCj4gKyAgICAgICBwLT5ibG9iX2xlbiA9
IGxlbmd0aDsNCj4gKyAgICAgICByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCB0
cnVzdGVkX2NhYW1fdW5zZWFsKHN0cnVjdCB0cnVzdGVkX2tleV9wYXlsb2FkICpwLCBjaGFyDQo+
ICsqZGF0YWJsb2IpIHsNCj4gKyAgICAgICBpbnQgbGVuZ3RoID0gcC0+YmxvYl9sZW47DQo+ICsg
ICAgICAgaW50IHJldDsNCj4gKw0KPiArICAgICAgIHJldCA9IGNhYW1fZGVjYXBfYmxvYihibG9i
aWZpZXIsIEtFWU1PRCwgcC0+YmxvYiwgcC0+a2V5LCBsZW5ndGgpOw0KPiArICAgICAgIGlmIChy
ZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiArDQo+ICsgICAgICAgcC0+a2V5
X2xlbiA9IGxlbmd0aCAtIENBQU1fQkxPQl9PVkVSSEVBRDsNCj4gKyAgICAgICByZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiArc3RhdGljIGludCB0cnVzdGVkX2NhYW1faW5pdCh2b2lkKQ0KPiArew0K
PiArICAgICAgIGludCByZXQ7DQo+ICsNCj4gKyAgICAgICBibG9iaWZpZXIgPSBjYWFtX2Jsb2Jf
Z2VuX2luaXQoKTsNCj4gKyAgICAgICBpZiAoSVNfRVJSKGJsb2JpZmllcikpIHsNCj4gKyAgICAg
ICAgICAgICAgIHByX2VycigiSm9iIFJpbmcgRGV2aWNlIGFsbG9jYXRpb24gZm9yIHRyYW5zZm9y
bSBmYWlsZWRcbiIpOw0KPiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoYmxvYmlmaWVy
KTsNCj4gKyAgICAgICB9DQo+ICsNCj4gKyAgICAgICByZXQgPSByZWdpc3Rlcl9rZXlfdHlwZSgm
a2V5X3R5cGVfdHJ1c3RlZCk7DQo+ICsgICAgICAgaWYgKHJldCkNCj4gKyAgICAgICAgICAgICAg
IGNhYW1fYmxvYl9nZW5fZXhpdChibG9iaWZpZXIpOw0KPiArDQo+ICsgICAgICAgcmV0dXJuIHJl
dDsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgdHJ1c3RlZF9jYWFtX2V4aXQodm9pZCkNCj4g
K3sNCj4gKyAgICAgICB1bnJlZ2lzdGVyX2tleV90eXBlKCZrZXlfdHlwZV90cnVzdGVkKTsNCj4g
KyAgICAgICBjYWFtX2Jsb2JfZ2VuX2V4aXQoYmxvYmlmaWVyKTsNCj4gK30NCj4gKw0KPiArc3Ry
dWN0IHRydXN0ZWRfa2V5X29wcyBjYWFtX3RydXN0ZWRfa2V5X29wcyA9IHsNCj4gKyAgICAgICAu
bWlncmF0YWJsZSA9IDAsIC8qIG5vbi1taWdyYXRhYmxlICovDQo+ICsgICAgICAgLmluaXQgPSB0
cnVzdGVkX2NhYW1faW5pdCwNCj4gKyAgICAgICAuc2VhbCA9IHRydXN0ZWRfY2FhbV9zZWFsLA0K
PiArICAgICAgIC51bnNlYWwgPSB0cnVzdGVkX2NhYW1fdW5zZWFsLA0KPiArICAgICAgIC5leGl0
ID0gdHJ1c3RlZF9jYWFtX2V4aXQsDQo+ICt9Ow0KPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkva2V5
cy90cnVzdGVkLWtleXMvdHJ1c3RlZF9jb3JlLmMgYi9zZWN1cml0eS9rZXlzL3RydXN0ZWQtDQo+
IGtleXMvdHJ1c3RlZF9jb3JlLmMNCj4gaW5kZXggOTIzNWZiN2QwZWM5Li42NDA0MzRjZDQzN2Eg
MTAwNjQ0DQo+IC0tLSBhL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1rZXlzL3RydXN0ZWRfY29yZS5j
DQo+ICsrKyBiL3NlY3VyaXR5L2tleXMvdHJ1c3RlZC1rZXlzL3RydXN0ZWRfY29yZS5jDQo+IEBA
IC05LDYgKzksNyBAQA0KPiAgI2luY2x1ZGUgPGtleXMvdXNlci10eXBlLmg+DQo+ICAjaW5jbHVk
ZSA8a2V5cy90cnVzdGVkLXR5cGUuaD4NCj4gICNpbmNsdWRlIDxrZXlzL3RydXN0ZWRfdGVlLmg+
DQo+ICsjaW5jbHVkZSA8a2V5cy90cnVzdGVkX2NhYW0uaD4NCj4gICNpbmNsdWRlIDxrZXlzL3Ry
dXN0ZWRfdHBtLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvY2FwYWJpbGl0eS5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L2Vyci5oPg0KPiBAQCAtMjksNyArMzAsNyBAQCBNT0RVTEVfUEFSTV9ERVNDKHJu
ZywgIlNlbGVjdCB0cnVzdGVkIGtleSBSTkciKTsNCj4gDQo+ICBzdGF0aWMgY2hhciAqdHJ1c3Rl
ZF9rZXlfc291cmNlOw0KPiAgbW9kdWxlX3BhcmFtX25hbWVkKHNvdXJjZSwgdHJ1c3RlZF9rZXlf
c291cmNlLCBjaGFycCwgMCk7IC0NCj4gTU9EVUxFX1BBUk1fREVTQyhzb3VyY2UsICJTZWxlY3Qg
dHJ1c3RlZCBrZXlzIHNvdXJjZSAodHBtIG9yIHRlZSkiKTsNCj4gK01PRFVMRV9QQVJNX0RFU0Mo
c291cmNlLCAiU2VsZWN0IHRydXN0ZWQga2V5cyBzb3VyY2UgKHRwbSwgdGVlIG9yDQo+ICtjYWFt
KSIpOw0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdHJ1c3RlZF9rZXlfc291cmNlIHRydXN0
ZWRfa2V5X3NvdXJjZXNbXSA9IHsgICNpZg0KPiBkZWZpbmVkKENPTkZJR19UUlVTVEVEX0tFWVNf
VFBNKSBAQCAtMzgsNiArMzksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0DQo+IHRydXN0ZWRfa2V5
X3NvdXJjZSB0cnVzdGVkX2tleV9zb3VyY2VzW10gPSB7ICAjaWYNCj4gZGVmaW5lZChDT05GSUdf
VFJVU1RFRF9LRVlTX1RFRSkNCj4gICAgICAgICB7ICJ0ZWUiLCAmdHJ1c3RlZF9rZXlfdGVlX29w
cyB9LCAgI2VuZGlmDQo+ICsjaWYgZGVmaW5lZChDT05GSUdfVFJVU1RFRF9LRVlTX0NBQU0pDQo+
ICsgICAgICAgeyAiY2FhbSIsICZjYWFtX3RydXN0ZWRfa2V5X29wcyB9LCAjZW5kaWYNCj4gIH07
DQo+IA0KPiAgREVGSU5FX1NUQVRJQ19DQUxMX05VTEwodHJ1c3RlZF9rZXlfaW5pdCwgKnRydXN0
ZWRfa2V5X3NvdXJjZXNbMF0ub3BzLQ0KPiA+aW5pdCk7DQo+IC0tDQo+IDIuMzAuMg0KDQo=
