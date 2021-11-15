Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806ED451793
	for <lists+linux-doc@lfdr.de>; Mon, 15 Nov 2021 23:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhKOWdC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Nov 2021 17:33:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:18484 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346787AbhKOWVI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Nov 2021 17:21:08 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="231003546"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="231003546"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 14:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="535658646"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2021 14:18:11 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 14:18:10 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 14:18:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 14:18:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 14:18:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDQ8v2iwQTCKiOrz1mIc4UVK99fUL73XHZCqNKvZsswACWAmWFs+7Ain28oOOk/zJlaSWYlJc1UgORV7ny3yeOTi5oyFx3uJlTEJzv74v4hBdQpoZcEzDGl3E4uCmEkfyx13AcppPEz4Uc+60YyBxtxGeqdRhNAIgBPrggQVeA1sI47QwvcSc0asxKG8cgFyc0RkdjOQO+nIoKx8pOwdsGBlgUyAcOF9gvrRAoqzXNK3seR8HBCYhnml/RP2v2GeBZ7S5OVvLobyKZSUKobpI1s13ejnTM3wm66CKaleMtrUWN0DB0zJv5aKphx1G1kHVH/rBcyy+ml9v8cM4WuNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjsrDgcTxQcmfTniL5Tss5G4SwnqM0onOWz/KosJKQE=;
 b=AjR88fT2outUbJoM5m7npdbMFZDBrCzuVKETGUC/FA//hAaKKxds+Y62knbd139GcauQ5Ryqk+Cj/+DJ5dF4aqB3Oxl6jzeJCa/KDmAFvrSyBYOW1zv6sygsAXlCOSDLqM/PgKjfRMaw+JHUAkQhmkzK49HkNCmYZUAcPZel5e2PAmkdDsufeFclQBoj23I5m0jF1KGxa8b4lg62YYpqCicR9/czo1We99al41qVJW66fQLqX5nId1ax78AkT+mODhxaQfafqts7OvyfkwtjHUf2EH1GhaYos1CDEK34gF268cMOXaO+BKer6CCJsOON3ODsfOh2bbhnQbxtf9/Uvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjsrDgcTxQcmfTniL5Tss5G4SwnqM0onOWz/KosJKQE=;
 b=xJktR4fy2UFbrUn7O5BkslBM3nI6D86JNPrxnT9uo2eXou4RoNMrMuyZ4Te6jtOEnGAVXPJXQSSP7agZYwjntP+AjpY/md4RmjC4hKOMBEcbUUnDkm0NB2aarO621wy1BUJL7C0CxEE8clMKCie54d0J2pT9XolKko1ajB4jp3Y=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 22:18:07 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 22:18:07 +0000
From:   "Winiarska, Iwona" <iwona.winiarska@intel.com>
To:     "Williams, Dan J" <dan.j.williams@intel.com>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
        "d.mueller@elsoft.ch" <d.mueller@elsoft.ch>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "Luck, Tony" <tony.luck@intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "zweiss@equinix.com" <zweiss@equinix.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>
Subject: Re: [PATCH v2 08/15] peci: Add device detection
Thread-Topic: [PATCH v2 08/15] peci: Add device detection
Thread-Index: AQHXiFupZNzUijJhQ02pJA/VS5Bl7KuH2w8AgH3xi4A=
Date:   Mon, 15 Nov 2021 22:18:06 +0000
Message-ID: <b664e784f2b14ac75693af0982fdcb1af89ef583.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
         <20210803113134.2262882-9-iwona.winiarska@intel.com>
         <CAPcyv4hPLReB6wGTDBM_tnqRUXxNASFCtgCw0=aDW+PPfSJ57A@mail.gmail.com>
In-Reply-To: <CAPcyv4hPLReB6wGTDBM_tnqRUXxNASFCtgCw0=aDW+PPfSJ57A@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18b64564-433a-4610-fa2c-08d9a885cce7
x-ms-traffictypediagnostic: MW3PR11MB4732:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <MW3PR11MB47320DC988EDB70099A28EFDEC989@MW3PR11MB4732.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YDA1GCoQSsYP3sMcmJKZqTacTZN/DXc7vKpP2hsXExABUxP8KpDKxouYgFrgvVCSYLVKujDVCBVV/R/JatsVHNc6MFVwIYItiwNxcOAjX9S5LC6fFeVQGkdpMundOYnnWTSN3+4FVu0quu+n7G69s0NhhkT0U46SmNxSQh50FHGkH7hPrcXSlDgwLcCXy3iR7FrV49VxILAuCc3hlR738c7gHwHaNGVsmfMZ0p11ayRL2Fl/YxYWjKVrP9czN204IbWYSn29V9aq69cWg8RUj4pDSzt35CIzCk4w2KeU+HZCxPVxV++rpPX8uVcrz35Uj2jMw6uC2gir7IKUKKX/XcTaOt3yvavWYla89xuo3YxHrecTzueVnsyDn1LyzF8PvvG91qBbgKkEk839lux93qxvPIdxSOJCiz2Q9zJVYvxKmG6y0oU2mDQuwLHEOJ+u/19d6BS3ByKCt/2oh8m1wYxJGyv6RTNmo/WKvfy6zDKmJdUB7bCwrp0urAfgX1fTxmoZqojvcWD2kaScpiQYwokzI0Ywrw4K0QqBTUqiRIVRzj1O4GKHdvSZl9nRezs/PG8OUaEee1AgyWAHk/+dcNXxHxn0LK9WEnQ5WvcVZMVCrjKcpvEqeQUJa7RvIXYPdmuPUyW7b6/nDIHLau3+W0MNlgdcN2Av/vUWmaX0Z31cbJwXid5Ax/55270bJwQ0HGnjhA4z8Ax9srjAi/zSrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(38070700005)(76116006)(122000001)(38100700002)(2906002)(66556008)(66946007)(86362001)(6506007)(91956017)(64756008)(66476007)(53546011)(8936002)(6512007)(2616005)(6636002)(83380400001)(82960400001)(6486002)(36756003)(71200400001)(7406005)(7416002)(66446008)(37006003)(4326008)(316002)(186003)(26005)(8676002)(54906003)(6862004)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWNYYnc1UE1yR3FBdHhhMlNCeDJveWx5VFVNd0ZDZnl1YmRwU2lVY1Z6OXFl?=
 =?utf-8?B?UXNkNmxmRTRkRGJ6dTBpYVRuQUhBZ050UkVxNnFxMHZrRS9qM2kzcTY5M2J2?=
 =?utf-8?B?SVpsMWpjdFQ2MktwM3ZkMU5BVC9uUzZFOWI1T3pIK0N1R1VBQmZ4TzFIWGpC?=
 =?utf-8?B?b2dibW9YV1RGTFpybEJOclNYZEY3UlR6OGdmbWgybzduOExvaWRmNTVQMnRa?=
 =?utf-8?B?TEx0Y1dpdHNZMEVMTGEzMk52UmpiWmJuS09xcWlaVFhnenNkT3hXU3JScHpw?=
 =?utf-8?B?UUUrUkdrNmxsNTFiSUF3ZjhRUWRHbkxKY0hIMXpQeDJKQ0cvRVFPdFhKTTZs?=
 =?utf-8?B?d3pKOUhiS1ZKYm9vWjYxeWxTOExvRk1pTm5tZnUwUTUycmNPM3RSRlJmSnJz?=
 =?utf-8?B?SjVWMjdXSnVteHg0SW9pQXRBRmN5V1hLWXE3VUxxeklDWklUdHRZUzNyYzQ0?=
 =?utf-8?B?QU45SC9TMnNiTHUxVExJanhmNFROYVNaQ0hvalpibE12Nzd3d2pBNDVmMFVC?=
 =?utf-8?B?Ymc1NUlSSG4rZVBVR2JEMUZnaDlnV0RPZHYwT2taSTRsU1ozWG0zdDYraFFB?=
 =?utf-8?B?RDYxTDV6WXBMTTVtZGhPYkF5cmxCdjZSdlNnclRXSzJLbkxIWTBDQVZXN1I2?=
 =?utf-8?B?RFVwZ2E1dC9Mak4zUjhDOXYzRkdPTnhMcW9ZQVU4NzQ3TFhMNUp0NXp2UzE2?=
 =?utf-8?B?RW5mVStNZ1RYaENwZi9waDFxN1AwcVA0RUQvRGVIMWlXUWJMejZxcXVWa2l4?=
 =?utf-8?B?MHNpQ3VVcHNvN3E3bFdGVzZnUk1DQVRLU0Z1YnFEQ01xYmxpMTI5cEtBT0Vr?=
 =?utf-8?B?UFdjNWc2YVg0ck0xWE9SQlVnTzlKYWdLNnVza09Za2ptRlNyNmxZeVlXZDhY?=
 =?utf-8?B?Nm9jTjJKT2RBKzE1Zmt3ZUNXS3c5elRSMzNUWW5SajV0bWtra09rUTUya3dV?=
 =?utf-8?B?ZFh6RkJObENoNXduczFhUEJWSXRYUmNOQVhrNWZyeUdUMi83YlkvUzVpTVNN?=
 =?utf-8?B?ZlcwcWZ0aFVvcEJxNU5CYWtKK3VpZWtIYXdscFpjVjVVaWJxdUJIZ3dmdXlU?=
 =?utf-8?B?bEVDckMzTktPeEFzdnJoczRCSjBvVVN5QkRxamJteE1ja2RFL05XL3pmU2dF?=
 =?utf-8?B?cWhYSmVxQ2poR1dzNU9kc2xMWDdGNHkxMzZJZldjQlBabVE5S2F0Q01MRWlY?=
 =?utf-8?B?aWtBSTA4bWpPSmpPZktMUmx5aW9rdERYWUFiWVZ3dUd2eTdzUmQ3VjMyMnB5?=
 =?utf-8?B?VjNpQzdmUDdrak84NzhSUnJWU1NXWEt0M29XY2t6Z1JHV1dldXFDM2toQm9D?=
 =?utf-8?B?d1p1MW9zZmpVNWtiT1hGRGF6UmlVMzZ3cFBkVGVleDZSWFJ1QithRHBPbE5l?=
 =?utf-8?B?OGpvU3g4Rk5qSGVPeXA5Z2FLeGwwcXE3dExnRTVvQUxvZkZycG92S0RQZzN2?=
 =?utf-8?B?K3JXTUpGeE5GUzFjSGZFcDRvN2tReTJTbFRSbVlHQmY3eGJhWCt5UEFiQktl?=
 =?utf-8?B?QjBEV095eG93enN0a3ZBV2sySC9pV2VGQnJPbDNtb0IwTzc3QVdqa3BwNGll?=
 =?utf-8?B?UGh5dlVrKzZaWTl2YjZNVVlwMjlDOFFSWUplMFJzZ2RuY1dCK25pWXFYVGR2?=
 =?utf-8?B?QVhJYWxHL2ZhMWhpNTZNQ3pMdGVaYUdKbDlQZDJ6YTFXZTdLQk1PeVBmL3Yr?=
 =?utf-8?B?ZkdIOUdhN3FGYjA3RWZBMmJpMUxyZWRMT2p0VG5xY25RZ2h3V1M3eVdHWDI4?=
 =?utf-8?B?a2hmRlQ5NEFxQ1J2aHViZEtWMVhIZDZCTWJsTU1xMnIvU3ZVMjFtdm53RFFM?=
 =?utf-8?B?ZVYrL1VBTjBab2pOK3pGZEJpWE9hYlBJMmtkTDRENUlyaWdrSG5xcG9tWkxi?=
 =?utf-8?B?OVJNNy8yYmszcDdnMDdGMXpEdXVTMGt1U0t3eTc4NUhYK1RhNDE4anNCKzl5?=
 =?utf-8?B?bGdsbTBoeWdzNlNIcHFWcHZKZzRIa2UyakZaK21Rd29RajdMU1V5TElmWlNp?=
 =?utf-8?B?d2NTUnlibXBSN2N3dldFWEtRN0grZklnVkJpSVRpUTUzdlpUZktwWlp1S1Bh?=
 =?utf-8?B?K1E3WHNiQVV6QkMxRWtBeWpORG11cmFSTHZKRlBKT2FtT3piVUVrNmRUaVlh?=
 =?utf-8?B?L1BGb0NDSHhPYm14WkhLT3hjN0d4RVF5OWFSc09hWVJxajVTS2NnWG9WSWth?=
 =?utf-8?B?blFmeDdOSnlPOHFXbGhsVkhteUhXMzJob0cvVXN3K3JOSTFFRk8xMk5qcFY5?=
 =?utf-8?Q?g+MtP7TI/rN3ReWpLj9womoCYPz8CA06qcia80tIuY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD652D6E4137844D9DC866EB0897D0A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b64564-433a-4610-fa2c-08d9a885cce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 22:18:06.9894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdySH2Au2IUjlpGlraLPuZOcBXdteTrgic8aHTSjUs2OVioOOeMrVaBIybPI6Xjtvy+Wd61udbyDymb3iHANzJwW1kO68VGLmPiHBU9b2LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCAyMDIxLTA4LTI3IGF0IDEyOjAxIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6DQo+
IE9uIFR1ZSwgQXVnIDMsIDIwMjEgYXQgNDozNSBBTSBJd29uYSBXaW5pYXJza2ENCj4gPGl3b25h
LndpbmlhcnNrYUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IFNpbmNlIFBFQ0kgZGV2aWNl
cyBhcmUgZGlzY292ZXJhYmxlLCB3ZSBjYW4gZHluYW1pY2FsbHkgZGV0ZWN0IGRldmljZXMNCj4g
PiB0aGF0IGFyZSBhY3R1YWxseSBhdmFpbGFibGUgaW4gdGhlIHN5c3RlbS4NCj4gPiANCj4gPiBU
aGlzIGNoYW5nZSBjb21wbGVtZW50cyB0aGUgZWFybGllciBpbXBsZW1lbnRhdGlvbiBieSByZXNj
YW5uaW5nIFBFQ0kNCj4gPiBidXMgdG8gZGV0ZWN0IGF2YWlsYWJsZSBkZXZpY2VzLiBGb3IgdGhp
cyBwdXJwb3NlLCBpdCBhbHNvIGludHJvZHVjZXMgdGhlDQo+ID4gbWluaW1hbCBBUEkgZm9yIFBF
Q0kgcmVxdWVzdHMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxp
d29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMg
Qm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+IMKgZHJpdmVycy9wZWNpL01ha2VmaWxlwqDCoCB8wqDCoCAyICstDQo+ID4gwqBkcml2ZXJz
L3BlY2kvY29yZS5jwqDCoMKgwqAgfMKgIDMzICsrKysrKysrKysrKw0KPiA+IMKgZHJpdmVycy9w
ZWNpL2RldmljZS5jwqDCoCB8IDExNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gwqBkcml2ZXJzL3BlY2kvaW50ZXJuYWwuaCB8wqAgMTQgKysrKysNCj4gPiDC
oGRyaXZlcnMvcGVjaS9yZXF1ZXN0LmPCoCB8wqAgNTAgKysrKysrKysrKysrKysrKysrDQo+ID4g
wqA1IGZpbGVzIGNoYW5nZWQsIDIxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wZWNpL2RldmljZS5jDQo+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9wZWNpL3JlcXVlc3QuYw0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BlY2kvTWFrZWZpbGUgYi9kcml2ZXJzL3BlY2kvTWFrZWZpbGUNCj4gPiBpbmRl
eCA5MjZkOGRmMTVjYmQuLmM1ZjlkM2ZlMjFiYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Bl
Y2kvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL3BlY2kvTWFrZWZpbGUNCj4gPiBAQCAtMSw3
ICsxLDcgQEANCj4gPiDCoCMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0K
PiA+IA0KPiA+IMKgIyBDb3JlIGZ1bmN0aW9uYWxpdHkNCj4gPiAtcGVjaS15IDo9IGNvcmUubw0K
PiA+ICtwZWNpLXkgOj0gY29yZS5vIHJlcXVlc3QubyBkZXZpY2Uubw0KPiA+IMKgb2JqLSQoQ09O
RklHX1BFQ0kpICs9IHBlY2kubw0KPiA+IA0KPiA+IMKgIyBIYXJkd2FyZSBzcGVjaWZpYyBidXMg
ZHJpdmVycw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvY29yZS5jIGIvZHJpdmVycy9w
ZWNpL2NvcmUuYw0KPiA+IGluZGV4IDdiMzkzOGFmMDM5Ni4uZDE0M2YxYTdmZTk4IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvcGVjaS9jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL3BlY2kvY29y
ZS5jDQo+ID4gQEAgLTM0LDYgKzM0LDIwIEBAIHN0cnVjdCBkZXZpY2VfdHlwZSBwZWNpX2NvbnRy
b2xsZXJfdHlwZSA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoCAucmVsZWFzZcKgwqDCoMKgwqDCoMKg
ID0gcGVjaV9jb250cm9sbGVyX2Rldl9yZWxlYXNlLA0KPiA+IMKgfTsNCj4gPiANCj4gPiArc3Rh
dGljIGludCBwZWNpX2NvbnRyb2xsZXJfc2Nhbl9kZXZpY2VzKHN0cnVjdCBwZWNpX2NvbnRyb2xs
ZXIgKmNvbnRyb2xsZXIpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgIGludCByZXQ7DQo+ID4g
K8KgwqDCoMKgwqDCoCB1OCBhZGRyOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIGZvciAoYWRk
ciA9IFBFQ0lfQkFTRV9BRERSOyBhZGRyIDwgUEVDSV9CQVNFX0FERFIgKw0KPiA+IFBFQ0lfREVW
SUNFX05VTV9NQVg7IGFkZHIrKykgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldCA9IHBlY2lfZGV2aWNlX2NyZWF0ZShjb250cm9sbGVyLCBhZGRyKTsNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+ICvCoMKgwqDCoMKgwqAg
fQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+
IMKgc3RhdGljIHN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKnBlY2lfY29udHJvbGxlcl9hbGxvYyhz
dHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0DQo+ID4gcGVjaV9jb250cm9sbGVyX29wcyAqb3BzKQ0KPiA+
IMKgew0KPiA+IEBAIC03NiwxMCArOTAsMjMgQEAgc3RhdGljIHN0cnVjdCBwZWNpX2NvbnRyb2xs
ZXINCj4gPiAqcGVjaV9jb250cm9sbGVyX2FsbG9jKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihyZXQpOw0KPiA+IMKgfQ0KPiA+IA0KPiA+ICtz
dGF0aWMgaW50IHVucmVnaXN0ZXJfY2hpbGQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkdW1t
eSkNCj4gPiArew0KPiA+ICvCoMKgwqDCoMKgwqAgcGVjaV9kZXZpY2VfZGVzdHJveSh0b19wZWNp
X2RldmljZShkZXYpKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiDCoHN0YXRpYyB2b2lkIHVucmVnaXN0ZXJfY29udHJvbGxlcih2b2lkICpf
Y29udHJvbGxlcikNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGVjaV9jb250
cm9sbGVyICpjb250cm9sbGVyID0gX2NvbnRyb2xsZXI7DQo+ID4gDQo+ID4gK8KgwqDCoMKgwqDC
oCAvKg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIERldGFjaCBhbnkgYWN0aXZlIFBFQ0kgZGV2aWNl
cy4gVGhpcyBjYW4ndCBmYWlsLCB0aHVzIHdlIGRvIG5vdA0KPiA+ICvCoMKgwqDCoMKgwqDCoCAq
IGNoZWNrIHRoZSByZXR1cm5lZCB2YWx1ZS4NCj4gPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiAr
wqDCoMKgwqDCoMKgIGRldmljZV9mb3JfZWFjaF9jaGlsZF9yZXZlcnNlKCZjb250cm9sbGVyLT5k
ZXYsIE5VTEwsDQo+ID4gdW5yZWdpc3Rlcl9jaGlsZCk7DQo+ID4gKw0KPiA+IMKgwqDCoMKgwqDC
oMKgIGRldmljZV91bnJlZ2lzdGVyKCZjb250cm9sbGVyLT5kZXYpOw0KPiA+IMKgfQ0KPiA+IA0K
PiA+IEBAIC0xMTUsNiArMTQyLDEyIEBAIHN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmRldm1fcGVj
aV9jb250cm9sbGVyX2FkZChzdHJ1Y3QNCj4gPiBkZXZpY2UgKmRldiwNCj4gPiDCoMKgwqDCoMKg
wqDCoCBpZiAocmV0KQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
RVJSX1BUUihyZXQpOw0KPiA+IA0KPiA+ICvCoMKgwqDCoMKgwqAgLyoNCj4gPiArwqDCoMKgwqDC
oMKgwqAgKiBJZ25vcmluZyByZXR2YWwgc2luY2UgZmFpbHVyZXMgZHVyaW5nIHNjYW4gYXJlIG5v
bi1jcml0aWNhbCBmb3INCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBjb250cm9sbGVyIGl0c2VsZi4N
Cj4gPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiArwqDCoMKgwqDCoMKgIHBlY2lfY29udHJvbGxl
cl9zY2FuX2RldmljZXMoY29udHJvbGxlcik7DQo+ID4gKw0KPiA+IMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBjb250cm9sbGVyOw0KPiA+IA0KPiA+IMKgZXJyOg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BlY2kvZGV2aWNlLmMgYi9kcml2ZXJzL3BlY2kvZGV2aWNlLmMNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzI4MTEyNDg5OTdiDQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvcGVjaS9kZXZpY2UuYw0KPiA+IEBAIC0wLDAg
KzEsMTE0IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkN
Cj4gPiArLy8gQ29weXJpZ2h0IChjKSAyMDE4LTIwMjEgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiAr
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wZWNpLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAiaW50ZXJuYWwuaCINCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgcGVjaV9kZXRlY3Qoc3RydWN0IHBlY2lfY29udHJvbGxlciAqY29udHJvbGxlciwgdTgg
YWRkcikNCj4gPiArew0KPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVx
Ow0KPiA+ICvCoMKgwqDCoMKgwqAgaW50IHJldDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCAv
Kg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIFBFQ0kgUGluZyBpcyBhIGNvbW1hbmQgZW5jb2RlZCBi
eSB0eF9sZW4gPSAwLCByeF9sZW4gPSAwLg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIFdlIGV4cGVj
dCBjb3JyZWN0IFdyaXRlIEZDUyBpZiB0aGUgZGV2aWNlIGF0IHRoZSB0YXJnZXQgYWRkcmVzcw0K
PiA+ICvCoMKgwqDCoMKgwqDCoCAqIGlzIGFibGUgdG8gcmVzcG9uZC4NCj4gPiArwqDCoMKgwqDC
oMKgwqAgKi8NCj4gPiArwqDCoMKgwqDCoMKgIHJlcSA9IHBlY2lfcmVxdWVzdF9hbGxvYyhOVUxM
LCAwLCAwKTsNCj4gPiArwqDCoMKgwqDCoMKgIGlmICghcmVxKQ0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOw0KPiANCj4gU2VlbXMgYSB3YXN0ZSB0byBk
byBhIGhlYXAgYWxsb2NhdGlvbiBmb3IgdGhpcyByb3V0aW5lLiBXaHkgbm90Og0KPiANCj4gwqDC
oMKgwqDCoMKgIC8qDQo+IMKgwqDCoMKgwqDCoMKgICogUEVDSSBQaW5nIGlzIGEgY29tbWFuZCBl
bmNvZGVkIGJ5IHR4X2xlbiA9IDAsIHJ4X2xlbiA9IDAuDQo+IMKgwqDCoMKgwqDCoMKgICogV2Ug
ZXhwZWN0IGNvcnJlY3QgV3JpdGUgRkNTIGlmIHRoZSBkZXZpY2UgYXQgdGhlIHRhcmdldCBhZGRy
ZXNzDQo+IMKgwqDCoMKgwqDCoMKgICogaXMgYWJsZSB0byByZXNwb25kLg0KPiDCoMKgwqDCoMKg
wqDCoCAqLw0KPiDCoMKgwqDCoMKgwqAgc3RydWN0IHBlY2lfcmVxdWVzdCByZXEgPSB7IDAgfTsN
Cg0KRG9uZS4NCg0KPiANCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZjb250
cm9sbGVyLT5idXNfbG9jayk7DQo+ID4gK8KgwqDCoMKgwqDCoCByZXQgPSBjb250cm9sbGVyLT5v
cHMtPnhmZXIoY29udHJvbGxlciwgYWRkciwgcmVxKTsNCj4gPiArwqDCoMKgwqDCoMKgIG11dGV4
X3VubG9jaygmY29udHJvbGxlci0+YnVzX2xvY2spOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKg
IHBlY2lfcmVxdWVzdF9mcmVlKHJlcSk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgcGVjaV9hZGRyX3ZhbGlkKHU4
IGFkZHIpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiBhZGRyID49IFBFQ0lfQkFT
RV9BRERSICYmIGFkZHIgPCBQRUNJX0JBU0VfQUREUiArDQo+ID4gUEVDSV9ERVZJQ0VfTlVNX01B
WDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBwZWNpX2Rldl9leGlzdHMoc3RydWN0
IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoCBzdHJ1
Y3QgcGVjaV9kZXZpY2UgKmRldmljZSA9IHRvX3BlY2lfZGV2aWNlKGRldik7DQo+ID4gK8KgwqDC
oMKgwqDCoCB1OCAqYWRkciA9IGRhdGE7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgaWYgKGRl
dmljZS0+YWRkciA9PSAqYWRkcikNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVCVVNZOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICtpbnQgcGVjaV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBwZWNpX2NvbnRyb2xs
ZXIgKmNvbnRyb2xsZXIsIHU4IGFkZHIpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgIHN0cnVj
dCBwZWNpX2RldmljZSAqZGV2aWNlOw0KPiA+ICvCoMKgwqDCoMKgwqAgaW50IHJldDsNCj4gPiAr
DQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoV0FSTl9PTighcGVjaV9hZGRyX3ZhbGlkKGFkZHIpKSkN
Cj4gDQo+IFRoZSBXQVJOX09OIGlzIG92ZXJraWxsLCBlc3BlY2lhbGx5IGFzIHRoZXJlIGlzIG9u
bHkgb25lIGNhbGxlciBvZg0KPiB0aGlzIGFuZCBpdCBsb29wcyB0aHJvdWdoIHZhbGlkIGFkZHJl
c3Nlcy4NCg0KRG9uZS4NCg0KPiANCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCAvKiBDaGVjayBpZiB3ZSBo
YXZlIGFscmVhZHkgZGV0ZWN0ZWQgdGhpcyBkZXZpY2UgYmVmb3JlLiAqLw0KPiA+ICvCoMKgwqDC
oMKgwqAgcmV0ID0gZGV2aWNlX2Zvcl9lYWNoX2NoaWxkKCZjb250cm9sbGVyLT5kZXYsICZhZGRy
LA0KPiA+IHBlY2lfZGV2X2V4aXN0cyk7DQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAocmV0KQ0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiA+ICsNCj4gPiArwqDC
oMKgwqDCoMKgIHJldCA9IHBlY2lfZGV0ZWN0KGNvbnRyb2xsZXIsIGFkZHIpOw0KPiA+ICvCoMKg
wqDCoMKgwqAgaWYgKHJldCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIERldmljZSBub3QgcHJlc2Vu
dCBvciBob3N0IHN0YXRlIGRvZXNuJ3QgYWxsb3cgc3VjY2Vzc2Z1bA0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBkZXRlY3Rpb24gYXQgdGhpcyB0aW1lLg0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAocmV0ID09IC1FSU8gfHwgcmV0ID09IC1FVElNRURPVVQpDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiA+ICsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+ICvCoMKg
wqDCoMKgwqAgfQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIGRldmljZSA9IGt6YWxsb2Moc2l6
ZW9mKCpkZXZpY2UpLCBHRlBfS0VSTkVMKTsNCj4gPiArwqDCoMKgwqDCoMKgIGlmICghZGV2aWNl
KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOw0KPiA+
ICsNCj4gPiArwqDCoMKgwqDCoMKgIGRldmljZS0+YWRkciA9IGFkZHI7DQo+ID4gK8KgwqDCoMKg
wqDCoCBkZXZpY2UtPmRldi5wYXJlbnQgPSAmY29udHJvbGxlci0+ZGV2Ow0KPiA+ICvCoMKgwqDC
oMKgwqAgZGV2aWNlLT5kZXYuYnVzID0gJnBlY2lfYnVzX3R5cGU7DQo+ID4gK8KgwqDCoMKgwqDC
oCBkZXZpY2UtPmRldi50eXBlID0gJnBlY2lfZGV2aWNlX3R5cGU7DQo+ID4gKw0KPiA+ICvCoMKg
wqDCoMKgwqAgcmV0ID0gZGV2X3NldF9uYW1lKCZkZXZpY2UtPmRldiwgIiVkLSUwMngiLCBjb250
cm9sbGVyLT5pZCwgZGV2aWNlLQ0KPiA+ID5hZGRyKTsNCj4gPiArwqDCoMKgwqDCoMKgIGlmIChy
ZXQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfZnJlZTsNCj4g
DQo+IEl0J3MgY2xlYW5lciB0byBqdXN0IGhhdmUgb25lIHVuaWZpZWQgZXJyb3IgZXhpdCB1c2lu
ZyBwdXRfZGV2aWNlKCkuDQo+IFVzZSB0aGUgZGV2aWNlX2luaXRpYWxpemUoKSArIGRldmljZV9h
ZGQoKSBwYXR0ZXJuLCBub3QNCj4gZGV2aWNlX3JlZ2lzdGVyKCkuDQoNCkRvbmUuDQoNCj4gDQo+
IA0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIHJldCA9IGRldmljZV9yZWdpc3RlcigmZGV2aWNl
LT5kZXYpOw0KPiA+ICvCoMKgwqDCoMKgwqAgaWYgKHJldCkNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIGVycl9wdXQ7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7DQo+ID4gKw0KPiA+ICtlcnJfcHV0Og0KPiA+ICvCoMKgwqDCoMKgwqAgcHV0X2Rldmlj
ZSgmZGV2aWNlLT5kZXYpOw0KPiA+ICtlcnJfZnJlZToNCj4gPiArwqDCoMKgwqDCoMKgIGtmcmVl
KGRldmljZSk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4gPiArfQ0K
PiA+ICsNCj4gPiArdm9pZCBwZWNpX2RldmljZV9kZXN0cm95KHN0cnVjdCBwZWNpX2RldmljZSAq
ZGV2aWNlKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoCBkZXZpY2VfdW5yZWdpc3RlcigmZGV2
aWNlLT5kZXYpOw0KPiANCj4gTm8gY2xlYXIgdmFsdWUgZm9yIHRoaXMgd3JhcHBlciwgaW4gZmFj
dCBpbiBvbmUgY2FsbGVyIGl0IGNhdXNlcyBpdCB0bw0KPiBkbyBhIHRvX3BlY2lfZGV2aWNlKCkg
anVzdCB0aGlzIGhlbHBlciBjYW4gdW5kbyB0aGF0IHVwLWNhc3QuDQoNCkl0IGdhaW5zIHZhbHVl
IGFmdGVyIGV4dGVuZGluZyBpdCB3aXRoIGtpbGxfZGV2aWNlKCkuDQoNCj4gDQo+ID4gK30NCj4g
PiArDQo+ID4gK3N0YXRpYyB2b2lkIHBlY2lfZGV2aWNlX3JlbGVhc2Uoc3RydWN0IGRldmljZSAq
ZGV2KQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgcGVjaV9kZXZpY2UgKmRldmlj
ZSA9IHRvX3BlY2lfZGV2aWNlKGRldik7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqAga2ZyZWUo
ZGV2aWNlKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RydWN0IGRldmljZV90eXBlIHBlY2lfZGV2
aWNlX3R5cGUgPSB7DQo+ID4gK8KgwqDCoMKgwqDCoCAucmVsZWFzZcKgwqDCoMKgwqDCoMKgID0g
cGVjaV9kZXZpY2VfcmVsZWFzZSwNCj4gPiArfTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
ZWNpL2ludGVybmFsLmggYi9kcml2ZXJzL3BlY2kvaW50ZXJuYWwuaA0KPiA+IGluZGV4IDkxOGRl
YTc0NWE4Ni4uNTdkMTFhOTAyYzVkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGVjaS9pbnRl
cm5hbC5oDQo+ID4gKysrIGIvZHJpdmVycy9wZWNpL2ludGVybmFsLmgNCj4gPiBAQCAtOCw2ICs4
LDIwIEBADQo+ID4gwqAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPiANCj4gPiDCoHN0cnVj
dCBwZWNpX2NvbnRyb2xsZXI7DQo+ID4gK3N0cnVjdCBwZWNpX2RldmljZTsNCj4gPiArc3RydWN0
IHBlY2lfcmVxdWVzdDsNCj4gPiArDQo+ID4gKy8qIFBFQ0kgQ1BVIGFkZHJlc3MgcmFuZ2UgMHgz
MC0weDM3ICovDQo+ID4gKyNkZWZpbmUgUEVDSV9CQVNFX0FERFLCoMKgwqDCoMKgwqDCoMKgIDB4
MzANCj4gPiArI2RlZmluZSBQRUNJX0RFVklDRV9OVU1fTUFYwqDCoMKgIDgNCj4gPiArDQo+ID4g
K3N0cnVjdCBwZWNpX3JlcXVlc3QgKnBlY2lfcmVxdWVzdF9hbGxvYyhzdHJ1Y3QgcGVjaV9kZXZp
Y2UgKmRldmljZSwgdTgNCj4gPiB0eF9sZW4sIHU4IHJ4X2xlbik7DQo+ID4gK3ZvaWQgcGVjaV9y
ZXF1ZXN0X2ZyZWUoc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxKTsNCj4gPiArDQo+ID4gK2V4dGVy
biBzdHJ1Y3QgZGV2aWNlX3R5cGUgcGVjaV9kZXZpY2VfdHlwZTsNCj4gPiArDQo+ID4gK2ludCBw
ZWNpX2RldmljZV9jcmVhdGUoc3RydWN0IHBlY2lfY29udHJvbGxlciAqY29udHJvbGxlciwgdTgg
YWRkcik7DQo+ID4gK3ZvaWQgcGVjaV9kZXZpY2VfZGVzdHJveShzdHJ1Y3QgcGVjaV9kZXZpY2Ug
KmRldmljZSk7DQo+ID4gDQo+ID4gwqBleHRlcm4gc3RydWN0IGJ1c190eXBlIHBlY2lfYnVzX3R5
cGU7DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVjaS9yZXF1ZXN0LmMgYi9kcml2
ZXJzL3BlY2kvcmVxdWVzdC5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjgxYjU2N2JjN2I4Nw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9k
cml2ZXJzL3BlY2kvcmVxdWVzdC5jDQo+ID4gQEAgLTAsMCArMSw1MCBAQA0KPiA+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gKy8vIENvcHlyaWdodCAoYykg
MjAyMSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2V4cG9y
dC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcGVjaS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
c2xhYi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPiArDQo+ID4gKyNpbmNs
dWRlICJpbnRlcm5hbC5oIg0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHBlY2lfcmVxdWVzdF9h
bGxvYygpIC0gYWxsb2NhdGUgJnN0cnVjdCBwZWNpX3JlcXVlc3RzDQo+ID4gKyAqIEBkZXZpY2U6
IFBFQ0kgZGV2aWNlIHRvIHdoaWNoIHJlcXVlc3QgaXMgZ29pbmcgdG8gYmUgc2VudA0KPiA+ICsg
KiBAdHhfbGVuOiBUWCBsZW5ndGgNCj4gPiArICogQHJ4X2xlbjogUlggbGVuZ3RoDQo+ID4gKyAq
DQo+ID4gKyAqIFJldHVybjogQSBwb2ludGVyIHRvIGEgbmV3bHkgYWxsb2NhdGVkICZzdHJ1Y3Qg
cGVjaV9yZXF1ZXN0IG9uIHN1Y2Nlc3MNCj4gPiBvciBOVUxMIG90aGVyd2lzZS4NCj4gPiArICov
DQo+ID4gK3N0cnVjdCBwZWNpX3JlcXVlc3QgKnBlY2lfcmVxdWVzdF9hbGxvYyhzdHJ1Y3QgcGVj
aV9kZXZpY2UgKmRldmljZSwgdTgNCj4gPiB0eF9sZW4sIHU4IHJ4X2xlbikNCj4gPiArew0KPiA+
ICvCoMKgwqDCoMKgwqAgc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxOw0KPiA+ICsNCj4gPiArwqDC
oMKgwqDCoMKgIGlmIChXQVJOX09OX09OQ0UodHhfbGVuID4gUEVDSV9SRVFVRVNUX01BWF9CVUZf
U0laRSB8fCByeF9sZW4gPg0KPiA+IFBFQ0lfUkVRVUVTVF9NQVhfQlVGX1NJWkUpKQ0KPiANCj4g
V0FSTl9PTl9PTkNFKCkgc2hvdWxkIG9ubHkgYmUgaGVyZSB0byBoZWxwIG90aGVyIGtlcm5lbCBk
ZXZlbG9wZXJzIG5vdA0KPiBtYWtlIHRoaXMgbWlzdGFrZSBIb3dldmVyLCBhbm90aGVyIHdheSB0
byBlbmZvcmNlIHRoaXMgaXMgdG8gc3RvcA0KPiBleHBvcnRpbmcgcGVjaV9yZXF1ZXN0X2FsbG9j
KCkgYW5kIGluc3RlYWQgZXhwb3J0IGhlbHBlcnMgZm9yIHNwZWNpZmljDQo+IGNvbW1hbmQgdHlw
ZXMsIGFuZCBrZWVwIHRoaXMgZGV0YWlsIGludGVybmFsIHRvIHRoZSBjb3JlLiBJZiB5b3Uga2Vl
cA0KPiB0aGlzLCBpdCBuZWVkcyBhIGNvbW1lbnQgdGhhdCBpdCBpcyBvbmx5IGhlcmUgdG8gd2Fy
biBvdGhlcg0KPiBwZWNpLWNsaWVudCBkZXZlbG9wZXJzIG9mIHRoZWlyIGJ1ZyBiZWZvcmUgaXQg
Z29lcyB1cHN0cmVhbS4NCg0KQWRkZWQgY29tbWVudC4NCg0KVGhhbmtzDQotSXdvbmENCg0K
