Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E57B651398
	for <lists+linux-doc@lfdr.de>; Mon, 19 Dec 2022 21:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbiLSUFI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Dec 2022 15:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbiLSUFG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Dec 2022 15:05:06 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FAF13F68;
        Mon, 19 Dec 2022 12:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuaN3l54SyW/B4FiTP+IQiiY8xISKP5BHUP8Yc11d05jSDNDPzWLfg2i8jSLashLvsOu84uIIYgQXeD715XwztkTFNqOc2OvyX/ptL/pT89FH0mLSLdbv4tkAWzFBBrlzkR4LiXm3HAnzD4xxMj9Ue5bVVOsU/Dp0C4WamE7dV9+TYI3x/EsQe70L6YYuQ8r0R9ESUCcTt2tuBdbPzNfy8NMoLsep3mjS0aRRcCgeVqrBLKn3fxNgv5xVnso2IhS7NabDd/02BsTFZjdnnNuJYP1IkBTmymFhW4zg3WKNpX1fdqLEpz5b+kAg/jevtGcGaNGTlTKSMrxorlxsZ1KIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzlfwnZKmK4UUiUJhkEAhKVY8Pubm0/Wpp65ZgcdZAc=;
 b=FwVwwTcj+Wvi1D+eIrGYkfZ4c5qC/dMT6/s5J7KkqiQLtu0siSARK2c4yf6+5O6J8HWdWa36wa/Q4Ea5+lgJL9SX+5f3M/dLmKxxO1TVWUyLNSC9kov0+xE5ubNDp1ZiN2u1Okq4VYOURYAu84yF4S8zm195B1RRrztDo/BonYNbPAcy7ZhH94hHzOYIv6R6eoJsP3qPAAkbrW06C+0cUpmxzDmNe3jSXmR2RptJmj6Xv2V2BLL6/Skz6uAMJkacD6H73fH4FGg8ejNVvPle/aR5FkgGbGwrbep6vfIXsKCB3YRkjiOaK6Z3a/ALDNcODyNWXTnzb8NwnkuvpBY56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzlfwnZKmK4UUiUJhkEAhKVY8Pubm0/Wpp65ZgcdZAc=;
 b=wEFhSV+BTsMuV8PNmjJgTH7dFIicsgGldvknIZnrAZxzp/6lYrOI/lg9nmWzLhVzpRzZA16aDnDCbTFOUX7pyUc0fV6/LNAZMqgOasTaUfEipFZU1jZmkhtpNpFSzanq9tBS7tyFoz1/4BlYINANCLBU11TMaRViYlC85DsyWE0=
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 20:05:02 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::790c:da77:2d05:6098]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::790c:da77:2d05:6098%5]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 20:05:02 +0000
From:   "Moger, Babu" <Babu.Moger@amd.com>
To:     Reinette Chatre <reinette.chatre@intel.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>
CC:     "fenghua.yu@intel.com" <fenghua.yu@intel.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "quic_neeraju@quicinc.com" <quic_neeraju@quicinc.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
        "songmuchun@bytedance.com" <songmuchun@bytedance.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "chang.seok.bae@intel.com" <chang.seok.bae@intel.com>,
        "pawan.kumar.gupta@linux.intel.com" 
        <pawan.kumar.gupta@linux.intel.com>,
        "jmattson@google.com" <jmattson@google.com>,
        "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
        "Das1, Sandipan" <Sandipan.Das@amd.com>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "james.morse@arm.com" <james.morse@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
        "eranian@google.com" <eranian@google.com>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
        "jarkko@kernel.org" <jarkko@kernel.org>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
        "peternewman@google.com" <peternewman@google.com>
Subject: RE: [PATCH v9 13/13] Documentation/x86: Update resctrl.rst for new
 features
Thread-Topic: [PATCH v9 13/13] Documentation/x86: Update resctrl.rst for new
 features
Thread-Index: AQHZBZrfwfsMVqeNdEyFRDcV++fwfq5vW2yAgAZim+A=
Date:   Mon, 19 Dec 2022 20:05:01 +0000
Message-ID: <MW3PR12MB455336176C5AA6E5DD45D1EB95E59@MW3PR12MB4553.namprd12.prod.outlook.com>
References: <166990882621.17806.16780480657453071426.stgit@bmoger-ubuntu>
 <166990905693.17806.6942517971262471285.stgit@bmoger-ubuntu>
 <14aca9af-e649-19a7-1be5-2389d6f8348b@intel.com>
In-Reply-To: <14aca9af-e649-19a7-1be5-2389d6f8348b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-12-19T20:01:02Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ab859f9c-097f-466a-a4e3-a983d58394db;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-12-19T20:05:00Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 1b92c2c5-91e7-4d39-9d9a-436622a55353
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR12MB4553:EE_|PH8PR12MB6916:EE_
x-ms-office365-filtering-correlation-id: 8e969303-9d94-478a-dc82-08dae1fc502e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nU9YwpoNUOsGe9ONu5CBUso2+5iiHYIf36XQcCHjfIOk7L/YxdBDbCvgf2Zbh1CxzAM4J8DJrnB47LBw6BYzu7622A2uaZ2Bz3RB8i8azUwjNIkr+//Nny/eL/P+d6X5rc9DbtixhTf1nM2ikB+jPAKXKkTEXYypmSKGksqvv/l9mHMchUAbc2uyMC6OO43GdXCRgL9S7+9oi0Hotde3x5w+lTCP+p6w7BNQQSi6laxgkOT37lBsH9lfb2lpKilAu89F1YAQJdszppbvzJ02A+RGeAFL1drDr/Z8DNypQju6017m7wjBsKkjKU4N7Pl2kdg249rnx3lXjRvjFaU5tkKxlawUwcGn0bZUSSLDTXqmyCS+KXk2GCMJhQkFYQZrgLL0GutaqF9U4yJXx3NXa7nIuMueGHMlQPAgeoaCa/uMUWAIMe/XOjLAF44+BHuMuY1/1wxfh1J4Vn428Nar+XZXgp0FN9RnnVrMX8dj2bKMowwdiuDc+pe9B9o65lKK/xq++Gzcr0lNdDQTphlrE3pNLIm40xqt6njGvsTdDtu6L/MxFtuwQYB/tSsPTU0gnnmodYs16AF40CX7YIek+q8N7JSlg6rS23ucansAGMNWip2nD2pKjsKN9emTpk4fkTugzzEzhXXhTplUDxe60dM8YhIpb5+x4ZRgYEWNr0uZqZHgxs3MXOg0hwSGcVmPSqPyR0ep0d+jee3kEmClmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(54906003)(38070700005)(6506007)(53546011)(7696005)(316002)(478600001)(38100700002)(110136005)(8676002)(4326008)(76116006)(86362001)(66476007)(7416002)(122000001)(64756008)(66556008)(66446008)(71200400001)(7406005)(66946007)(30864003)(33656002)(52536014)(83380400001)(8936002)(15650500001)(9686003)(2906002)(5660300002)(41300700001)(186003)(26005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3plM1RhaWVBdUV2MGtLbkhoRmtOeldaSGpSaU5VdUp1dWlBTVBiY05QM2VD?=
 =?utf-8?B?dWh6NWYvZk5EY3VXNHA0aTBQWFF3RUN6ZG1FamJ5dWZ6SG1ZdnlhaFBWNlhp?=
 =?utf-8?B?Ni9OaTNKWEcvTEtWNzZYTEVnRTl0RWdwZmhKZ0JMN0NXRGs1RmZmeHJFNnRl?=
 =?utf-8?B?R1NWM2o1M2pmVEtvbjkxSWQ2aUhWbEhpbm5rUURiak9uWXppNWg3WUNoS1Y4?=
 =?utf-8?B?WEp0QjluYVo0LzZvUUZpWUp0NmJjako2MEVwd2V5dVR6eXZHeTU2ZHJXb0Fz?=
 =?utf-8?B?UVNub0VXSCsxUTJXNGVweHFiN2pNdXRoTFpWVmc2WjJ6UEVONUJBRWVMSGZC?=
 =?utf-8?B?SGlrdkFlZU9kMTB3dHZndC9vbm9UcWFSSEhZNG1DQXIxS0pDK1RZQ0cwY0pV?=
 =?utf-8?B?dzVIUkRYYWxnYjNIaU0rUThTUHdCckordEVxdHp3bFRKeFJPYzZMbUpiQ3NS?=
 =?utf-8?B?cnRqaHBzbU8vM3krNThobFR4dlpwdFFFb2xvSWl1UFh6dkthTWFBYWFaekRm?=
 =?utf-8?B?TGhtNkhXZXFLSlphaytnR1loYTVyTEJvdWFpcno2NUxEQlhWVC9RRWdYcXU0?=
 =?utf-8?B?a1dtcU1qL3krdmxxQk45TVBLZlVEU2N1RHEyZ2EyN0h2NCtzZlBhbWNZcDdT?=
 =?utf-8?B?TTlXZmkwNmoreXZBbmMzYkdNQTZYcjdkZmZKYlc3WHZnNW52OWUrekwxaXYr?=
 =?utf-8?B?ZjBCalhKek9OQUdoaHRVRVE0M1hKc3RyczlobTVHTEFrcUEyL1p1T29WalZ4?=
 =?utf-8?B?U0dqZXQ0c010bmhRMElOQTVPVHZGY3VVMkJWNG5yUCsxUG41azliQ21kZzJ3?=
 =?utf-8?B?K2ZvZGl1K3FaQTVkaEhmZ3hTL3JaZ3BWY3dmeS9JMlhKcXFlQlI1SmNDaGZO?=
 =?utf-8?B?OFMzV0dZTG52c0pFM3RNK0xjWncwb0hnRy9GRzdBaURDSEFzbVc1S2RMdVQ5?=
 =?utf-8?B?dWFwQ1UzVnVBa2dUUGJRZDBnMFdsdS8rKzVOdUFwd2hnR0NVQS90OVZnbHhm?=
 =?utf-8?B?bndId3VKT2NxNzdVQjE1UHg2d09GUHhuVHNCRE5DUG5nSFdhcWR5QlBMcjdm?=
 =?utf-8?B?ZXZBa1J1d2R0YkJtYTgra2graTdPNmE2MEwvd3g3dHJhWG56TURVSUlTenBq?=
 =?utf-8?B?ZDlyNGZaUzFSdDVYK0U3RHpjeTNmeWZOZWdXQWZReU5iN3VqYzErVkV3Wm5G?=
 =?utf-8?B?MkJ2YmlhZXl2czk0QzZFMmRVMVloc0FOK3Zna2I2ZWxUUVQvVGk4cTVwUks5?=
 =?utf-8?B?Wm9xV0lIVUswM0Z3MXo1Q1JQSFprcUZzUVZCcmRNa1dFY3ZvMFVkQUtSWFh0?=
 =?utf-8?B?Mk5WdFE0YnNNdjQzaTZYM0YwcmI2YkR3SUk1UUplRXNJeXRQN3pZOTcvaVJp?=
 =?utf-8?B?ZW5CNS9GRHBPdWlLcTBuNDJLMUtkQWRhcU1xRkFLazB0OHlpbWtyWmdPT3I4?=
 =?utf-8?B?dzBrRktvb1NSUVZyVEtzWHRWQkN2ajMxWEdaL21ZVm52dGx6WVRMUGNORUdp?=
 =?utf-8?B?VGhJMlFXSnFsY3ZLTk5tSER4eENCcGNvc3BXOWRYMzViZUcrUDJSR3VjWS9L?=
 =?utf-8?B?S2FEeEZNM21JTGVOOEQwTzJuREhVVWpZV3drRHNzUE5IR0ZyZUNtVGFBWDVz?=
 =?utf-8?B?YUxlM0FhRXRpR0JCTWJNV21sQWZENjQ0aFJiV2NMalk0QTZTS0cyaGZHYWxN?=
 =?utf-8?B?Z2M1REZtN0NRalkzQTNESVFXRkVBa1MrZmlYWm05ZUc3bVIzWnRMaDc0T2xl?=
 =?utf-8?B?S20zZElQc3c0Q0RPT3p5WG5kd1ROVmp3RWxwY1FxelM0L29OcDBJNXJlNXdW?=
 =?utf-8?B?eTNsdFg5MEJaUkVwR3FrU3VOQzZlZDU5TmhOUG8zUTljeUhkb1JzdjZhWG9K?=
 =?utf-8?B?R1AvN3VTWWFnMTB5TjB6YSsvNnJicUo5aXlaaGVndUJ5aCs1Mld1a1d2Wk5w?=
 =?utf-8?B?cDJXTU9oMEhCVkdMRXMwZXFGclZGamg0MmZCYWlFRzF6N0F3QVZ1ZzNyNExj?=
 =?utf-8?B?dmIxR3FDWjMwelRSbm96bld6WjNpU2pZSkpiRkRTMmFFeWhNSzdtcTJBc2k2?=
 =?utf-8?B?VFFLL2EwbjJuUUxoL2ZDMkVFeWtyMnE5cFpOTndDQXZPdGhzdUxsWHhaYnB2?=
 =?utf-8?Q?cmaU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e969303-9d94-478a-dc82-08dae1fc502e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 20:05:01.9290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSMBKMDpeth2Uzjtb4oJLztk2veYDekDhl1E3mcalAJBGcb+LDuFrrEnhFHnndrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIFJlaW5ldHRlLA0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJlaW5ldHRlIENoYXRyZSA8cmVpbmV0
dGUuY2hhdHJlQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDE1LCAyMDIy
IDEyOjMxIFBNDQo+IFRvOiBNb2dlciwgQmFidSA8QmFidS5Nb2dlckBhbWQuY29tPjsgY29yYmV0
QGx3bi5uZXQ7DQo+IHRnbHhAbGludXRyb25peC5kZTsgbWluZ29AcmVkaGF0LmNvbTsgYnBAYWxp
ZW44LmRlDQo+IENjOiBmZW5naHVhLnl1QGludGVsLmNvbTsgZGF2ZS5oYW5zZW5AbGludXguaW50
ZWwuY29tOyB4ODZAa2VybmVsLm9yZzsNCj4gaHBhQHp5dG9yLmNvbTsgcGF1bG1ja0BrZXJuZWwu
b3JnOyBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnOw0KPiBxdWljX25lZXJhanVAcXVpY2luYy5j
b207IHJkdW5sYXBAaW5mcmFkZWFkLm9yZzsNCj4gZGFtaWVuLmxlbW9hbEBvcGVuc291cmNlLndk
Yy5jb207IHNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbTsNCj4gcGV0ZXJ6QGluZnJhZGVhZC5vcmc7
IGpwb2ltYm9lQGtlcm5lbC5vcmc7IHBib256aW5pQHJlZGhhdC5jb207DQo+IGNoYW5nLnNlb2su
YmFlQGludGVsLmNvbTsgcGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tOw0KPiBqbWF0
dHNvbkBnb29nbGUuY29tOyBkYW5pZWwuc25lZGRvbkBsaW51eC5pbnRlbC5jb207IERhczEsIFNh
bmRpcGFuDQo+IDxTYW5kaXBhbi5EYXNAYW1kLmNvbT47IHRvbnkubHVja0BpbnRlbC5jb207IGph
bWVzLm1vcnNlQGFybS5jb207DQo+IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGJhZ2FzZG90bWVAZ21haWwuY29tOyBlcmFuaWFuQGdv
b2dsZS5jb207IGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldTsNCj4gamFya2tvQGtlcm5lbC5v
cmc7IGFkcmlhbi5odW50ZXJAaW50ZWwuY29tOyBxdWljX2ppbGVzQHF1aWNpbmMuY29tOw0KPiBw
ZXRlcm5ld21hbkBnb29nbGUuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkgMTMvMTNdIERv
Y3VtZW50YXRpb24veDg2OiBVcGRhdGUgcmVzY3RybC5yc3QgZm9yIG5ldw0KPiBmZWF0dXJlcw0K
PiANCj4gSGkgQmFidSwNCj4gDQo+IE9uIDEyLzEvMjAyMiA3OjM3IEFNLCBCYWJ1IE1vZ2VyIHdy
b3RlOg0KPiA+IFVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIG5ldyBmZWF0dXJlczoN
Cj4gPiAxLiBTbG93IE1lbW9yeSBCYW5kd2lkdGggYWxsb2NhdGlvbiAoU01CQSkuDQo+ID4gICAg
V2l0aCB0aGlzIGZlYXR1cmUsIHRoZSBRT1MgIGVuZm9yY2VtZW50IHBvbGljaWVzIGNhbiBiZSBh
cHBsaWVkDQo+ID4gICAgdG8gdGhlIGV4dGVybmFsIHNsb3cgbWVtb3J5IGNvbm5lY3RlZCB0byB0
aGUgaG9zdC4gUU9TIGVuZm9yY2VtZW50DQo+ID4gICAgaXMgYWNjb21wbGlzaGVkIGJ5IGFzc2ln
bmluZyBhIENsYXNzIE9mIFNlcnZpY2UgKENPUykgdG8gYSBwcm9jZXNzb3INCj4gPiAgICBhbmQg
c3BlY2lmeWluZyBhbGxvY2F0aW9ucyBvciBsaW1pdHMgZm9yIHRoYXQgQ09TIGZvciBlYWNoIHJl
c291cmNlDQo+ID4gICAgdG8gYmUgYWxsb2NhdGVkLg0KPiA+DQo+ID4gMi4gQmFuZHdpZHRoIE1v
bml0b3JpbmcgRXZlbnQgQ29uZmlndXJhdGlvbiAoQk1FQykuDQo+ID4gICAgVGhlIGJhbmR3aWR0
aCBtb25pdG9yaW5nIGV2ZW50cyBtYm1fdG90YWxfYnl0ZXMgYW5kIG1ibV9sb2NhbF9ieXRlcw0K
PiA+ICAgIGFyZSBzZXQgdG8gY291bnQgYWxsIHRoZSB0b3RhbCBhbmQgbG9jYWwgcmVhZHMvd3Jp
dGVzIHJlc3BlY3RpdmVseS4NCj4gPiAgICBXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2Ygc2xvdyBt
ZW1vcnksIHRoZSB0d28gY291bnRlcnMgYXJlIG5vdA0KPiA+ICAgIGVub3VnaCB0byBjb3VudCBh
bGwgdGhlIGRpZmZlcmVudCB0eXBlcyBvZiBtZW1vcnkgZXZlbnRzLiBXaXRoIHRoZQ0KPiA+ICAg
IGZlYXR1cmUgQk1FQywgdGhlIHVzZXJzIGhhdmUgdGhlIG9wdGlvbiB0byBjb25maWd1cmUgbWJt
X3RvdGFsX2J5dGVzDQo+ID4gICAgYW5kIG1ibV9sb2NhbF9ieXRlcyB0byBjb3VudCB0aGUgc3Bl
Y2lmaWMgdHlwZSBvZiBldmVudHMuDQo+ID4NCj4gPiBBbHNvIGFkZCBjb25maWd1cmF0aW9uIGlu
c3RydWN0aW9ucyB3aXRoIGV4YW1wbGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmFidSBN
b2dlciA8YmFidS5tb2dlckBhbWQuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCYWdhcyBTYW5qYXlh
IDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi94ODYv
cmVzY3RybC5yc3QgfCAgMTM4DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24veDg2L3Jlc2N0cmwu
cnN0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL3g4Ni9yZXNjdHJsLnJzdCBpbmRleCA3MWE1MzEwNjFl
NGUuLjYwNzYxYTZmOTA4Nw0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24veDg2
L3Jlc2N0cmwucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi94ODYvcmVzY3RybC5yc3QNCj4g
PiBAQCAtMTcsMTQgKzE3LDE2IEBAIEFNRCByZWZlcnMgdG8gdGhpcyBmZWF0dXJlIGFzIEFNRCBQ
bGF0Zm9ybSBRdWFsaXR5DQo+IG9mIFNlcnZpY2UoQU1EIFFvUykuDQo+ID4gIFRoaXMgZmVhdHVy
ZSBpcyBlbmFibGVkIGJ5IHRoZSBDT05GSUdfWDg2X0NQVV9SRVNDVFJMIGFuZCB0aGUgeDg2DQo+
ID4gL3Byb2MvY3B1aW5mbyAgZmxhZyBiaXRzOg0KPiA+DQo+ID4gLT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAJPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCj4gCT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gIFJEVCAoUmVz
b3VyY2UgRGlyZWN0b3IgVGVjaG5vbG9neSkgQWxsb2NhdGlvbgkicmR0X2EiDQo+ID4gIENBVCAo
Q2FjaGUgQWxsb2NhdGlvbiBUZWNobm9sb2d5KQkJImNhdF9sMyIsICJjYXRfbDIiDQo+ID4gIENE
UCAoQ29kZSBhbmQgRGF0YSBQcmlvcml0aXphdGlvbikJCSJjZHBfbDMiLCAiY2RwX2wyIg0KPiA+
ICBDUU0gKENhY2hlIFFvUyBNb25pdG9yaW5nKQkJCSJjcW1fbGxjIiwNCj4gImNxbV9vY2N1cF9s
bGMiDQo+ID4gIE1CTSAoTWVtb3J5IEJhbmR3aWR0aCBNb25pdG9yaW5nKQkJImNxbV9tYm1fdG90
YWwiLA0KPiAiY3FtX21ibV9sb2NhbCINCj4gPiAgTUJBIChNZW1vcnkgQmFuZHdpZHRoIEFsbG9j
YXRpb24pCQkibWJhIg0KPiA+IC09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gCT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gK1NNQkEg
KFNsb3cgTWVtb3J5IEJhbmR3aWR0aCBBbGxvY2F0aW9uKSAgICAgICAgICJzbWJhIg0KPiA+ICtC
TUVDIChCYW5kd2lkdGggTW9uaXRvcmluZyBFdmVudCBDb25maWd1cmF0aW9uKSAiYm1lYyINCj4g
PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gCT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4NCj4gPiAgVG8gdXNlIHRoZSBmZWF0
dXJlIG1vdW50IHRoZSBmaWxlIHN5c3RlbTo6DQo+ID4NCj4gPiBAQCAtMTYxLDYgKzE2Myw3OSBA
QCB3aXRoIHRoZSBmb2xsb3dpbmcgZmlsZXM6DQo+ID4gICJtb25fZmVhdHVyZXMiOg0KPiA+ICAJ
CUxpc3RzIHRoZSBtb25pdG9yaW5nIGV2ZW50cyBpZg0KPiA+ICAJCW1vbml0b3JpbmcgaXMgZW5h
YmxlZCBmb3IgdGhlIHJlc291cmNlLg0KPiA+ICsgICAgICAgICAgICAgICAgRXhhbXBsZTo6DQo+
ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIyBjYXQgL3N5cy9mcy9yZXNjdHJsL2luZm8v
TDNfTU9OL21vbl9mZWF0dXJlcw0KPiA+ICsgICAgICAgICAgICAgICAgICAgbGxjX29jY3VwYW5j
eQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgbWJtX3RvdGFsX2J5dGVzDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICBtYm1fbG9jYWxfYnl0ZXMNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICBJ
ZiB0aGUgc3lzdGVtIHN1cHBvcnRzIEJhbmR3aWR0aCBNb25pdG9yaW5nIEV2ZW50DQo+ID4gKyAg
ICAgICAgICAgICAgICBDb25maWd1cmF0aW9uIChCTUVDKSwgdGhlbiB0aGUgYmFuZHdpZHRoIGV2
ZW50cyB3aWxsDQo+ID4gKyAgICAgICAgICAgICAgICBiZSBjb25maWd1cmFibGUuIFRoZSBvdXRw
dXQgd2lsbCBiZTo6DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIyBjYXQgL3N5cy9m
cy9yZXNjdHJsL2luZm8vTDNfTU9OL21vbl9mZWF0dXJlcw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgbGxjX29jY3VwYW5jeQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgbWJtX3RvdGFsX2J5dGVz
DQo+ID4gKyAgICAgICAgICAgICAgICAgICBtYm1fdG90YWxfYnl0ZXNfY29uZmlnDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICBtYm1fbG9jYWxfYnl0ZXMNCj4gPiArICAgICAgICAgICAgICAgICAg
IG1ibV9sb2NhbF9ieXRlc19jb25maWcNCj4gPiArDQo+ID4gKyJtYm1fdG90YWxfYnl0ZXNfY29u
ZmlnIiwgIm1ibV9sb2NhbF9ieXRlc19jb25maWciOg0KPiA+ICsgICAgICAgIFRoZXNlIGZpbGVz
IGNvbnRhaW4gdGhlIGN1cnJlbnQgZXZlbnQgY29uZmlndXJhdGlvbiBmb3IgdGhlDQo+ID4gK2V2
ZW50cw0KPiANCj4gIlRoZXNlIGZpbGVzIiBpcyByZWR1bmRhbnQuIE5vdGUgdGhhdCB0aGlzIGlz
IGFscmVhZHkgaW50cm9kdWNlZCB3aXRoICJ0aGUNCj4gZm9sbG93aW5nIGZpbGVzOiIuDQo+IFRv
IG1hdGNoIHNpbWlsYXIgZmlsZXMgaXQgY291bGQgcmVhZDoNCj4gIlJlYWQvd3JpdGUgZmlsZXMg
Y29udGFpbmluZyB0aGUgY29uZmlndXJhdGlvbiBmb3IgdGhlIG1ibV90b3RhbF9ieXRlcyBhbmQN
Cj4gbWJtX2xvY2FsX2J5dGVzIGV2ZW50cywgcmVzcGVjdGl2ZWx5LCAuLi4iDQoNClN1cmUuDQo+
IA0KPiA+ICsgICAgICAgIG1ibV90b3RhbF9ieXRlcyBhbmQgbWJtX2xvY2FsX2J5dGVzLCByZXNw
ZWN0aXZlbHksIHdoZW4gdGhlDQo+ID4gKyAgICAgICAgQmFuZHdpZHRoIE1vbml0b3JpbmcgRXZl
bnQgQ29uZmlndXJhdGlvbiAoQk1FQykgZmVhdHVyZSBpcw0KPiBzdXBwb3J0ZWQuDQo+ID4gKyAg
ICAgICAgVGhlIGV2ZW50IGNvbmZpZ3VyYXRpb24gc2V0dGluZ3MgYXJlIGRvbWFpbiBzcGVjaWZp
YyBhbmQgd2lsbA0KPiA+ICsgYWZmZWN0DQo+IA0KPiAid2lsbCIgY2FuIGJlIGRyb3BwZWQ/DQoN
ClN1cmUuDQo+IA0KPiA+ICsgICAgICAgIGFsbCB0aGUgQ1BVcyBpbiB0aGUgZG9tYWluLg0KPiA+
ICsNCj4gPiArICAgICAgICBGb2xsb3dpbmcgYXJlIHRoZSB0eXBlcyBvZiBldmVudHMgc3VwcG9y
dGVkOg0KPiA+ICsNCj4gPiArICAgICAgICA9PT09DQo+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gKyAgICAgICAgQml0cyAgICBE
ZXNjcmlwdGlvbg0KPiA+ICsgICAgICAgID09PT0NCj4gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiArICAgICAgICA2ICAgICAgIERp
cnR5IFZpY3RpbXMgZnJvbSB0aGUgUU9TIGRvbWFpbiB0byBhbGwgdHlwZXMgb2YgbWVtb3J5DQo+
ID4gKyAgICAgICAgNSAgICAgICBSZWFkcyB0byBzbG93IG1lbW9yeSBpbiB0aGUgbm9uLWxvY2Fs
IE5VTUEgZG9tYWluDQo+ID4gKyAgICAgICAgNCAgICAgICBSZWFkcyB0byBzbG93IG1lbW9yeSBp
biB0aGUgbG9jYWwgTlVNQSBkb21haW4NCj4gPiArICAgICAgICAzICAgICAgIE5vbi10ZW1wb3Jh
bCB3cml0ZXMgdG8gbm9uLWxvY2FsIE5VTUEgZG9tYWluDQo+ID4gKyAgICAgICAgMiAgICAgICBO
b24tdGVtcG9yYWwgd3JpdGVzIHRvIGxvY2FsIE5VTUEgZG9tYWluDQo+ID4gKyAgICAgICAgMSAg
ICAgICBSZWFkcyB0byBtZW1vcnkgaW4gdGhlIG5vbi1sb2NhbCBOVU1BIGRvbWFpbg0KPiA+ICsg
ICAgICAgIDAgICAgICAgUmVhZHMgdG8gbWVtb3J5IGluIHRoZSBsb2NhbCBOVU1BIGRvbWFpbg0K
PiA+ICsgICAgICAgID09PT0NCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gKyAgICAgICAgQnkgZGVmYXVsdCwgdGhl
IG1ibV90b3RhbF9ieXRlcyBjb25maWd1cmF0aW9uIGlzIHNldCB0byAweDdmIHRvIGNvdW50DQo+
ID4gKyAgICAgICAgYWxsIHRoZSBldmVudCB0eXBlcyBhbmQgdGhlIG1ibV9sb2NhbF9ieXRlcyBj
b25maWd1cmF0aW9uIGlzIHNldCB0bw0KPiA+ICsgICAgICAgIDB4MTUgdG8gY291bnQgYWxsIHRo
ZSBsb2NhbCBtZW1vcnkgZXZlbnRzLg0KPiA+ICsNCj4gPiArICAgICAgICBFeGFtcGxlczoNCj4g
PiArDQo+ID4gKyAgICAgICAgKiBUbyB2aWV3IHRoZSBjdXJyZW50IGNvbmZpZ3VyYXRpb246Og0K
PiA+ICsgICAgICAgICAgOjoNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICMgY2F0IC9zeXMvZnMv
cmVzY3RybC9pbmZvL0wzX01PTi9tYm1fdG90YWxfYnl0ZXNfY29uZmlnDQo+ID4gKyAgICAgICAg
ICAgIDA9MHg3ZjsxPTB4N2Y7Mj0weDdmOzM9MHg3Zg0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
IyBjYXQgL3N5cy9mcy9yZXNjdHJsL2luZm8vTDNfTU9OL21ibV9sb2NhbF9ieXRlc19jb25maWcN
Cj4gPiArICAgICAgICAgICAgMD0weDE1OzE9MHgxNTszPTB4MTU7ND0weDE1DQo+ID4gKw0KPiA+
ICsgICAgICAgICogVG8gY2hhbmdlIHRoZSBtYm1fdG90YWxfYnl0ZXMgdG8gY291bnQgb25seSBy
ZWFkcyBvbiBkb21haW4gMCwNCj4gPiArICAgICAgICAgIHRoZSBiaXRzIDAsIDEsIDQgYW5kIDUg
bmVlZHMgdG8gYmUgc2V0LCB3aGljaCBpcyAxMTAwMTFiIGluIGJpbmFyeQ0KPiA+ICsgICAgICAg
ICAgKGluIGhleGFkZWNpbWFsIDB4MzMpOg0KPiA+ICsgICAgICAgICAgOjoNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICMgZWNobyAgIjA9MHgzMyIgPg0KPiA+ICsgL3N5cy9mcy9yZXNjdHJsL2lu
Zm8vTDNfTU9OL21ibV90b3RhbF9ieXRlc19jb25maWcNCj4gPiArDQo+ID4gKyAgICAgICAgICAg
ICMgY2F0IC9zeXMvZnMvcmVzY3RybC9pbmZvL0wzX01PTi9tYm1fdG90YWxfYnl0ZXNfY29uZmln
DQo+ID4gKyAgICAgICAgICAgIDA9MHgzMzsxPTB4N2Y7Mj0weDdmOzM9MHg3Zg0KPiA+ICsNCj4g
PiArICAgICAgICAqIFRvIGNoYW5nZSB0aGUgbWJtX2xvY2FsX2J5dGVzIHRvIGNvdW50IGFsbCB0
aGUgc2xvdyBtZW1vcnkgcmVhZHMNCj4gb24NCj4gPiArICAgICAgICAgIGRvbWFpbiAwIGFuZCAx
LCB0aGUgYml0cyA0IGFuZCA1IG5lZWRzIHRvIGJlIHNldCwgd2hpY2ggaXMgMTEwMDAwYg0KPiA+
ICsgICAgICAgICAgaW4gYmluYXJ5IChpbiBoZXhhZGVjaW1hbCAweDMwKToNCj4gPiArICAgICAg
ICAgIDo6DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAjIGVjaG8gICIwPTB4MzA7MT0weDMwIiA+
DQo+ID4gKyAvc3lzL2ZzL3Jlc2N0cmwvaW5mby9MM19NT04vbWJtX2xvY2FsX2J5dGVzX2NvbmZp
Zw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIyBjYXQgL3N5cy9mcy9yZXNjdHJsL2luZm8vTDNf
TU9OL21ibV9sb2NhbF9ieXRlc19jb25maWcNCj4gPiArICAgICAgICAgICAgMD0weDMwOzE9MHgz
MDszPTB4MTU7ND0weDE1DQoNClBsYW5uaW5nIHRvIGFkZCB0aGUgZm9sbG93aW5nIHRleHQgaGVy
ZS4NCg0KIldoZW4gYW4gZXZlbnQgY29uZmlndXJhdGlvbiBpcyBjaGFuZ2VkLCB0aGUgYmFuZHdp
ZHRoIGNvdW50ZXJzIGZvciBhbGwgdGhlIFJNSURzIGFuZCB0aGUgZXZlbnRzIHdpbGwgYmUgY2xl
YXJlZCBmb3IgdGhhdCBkb21haW4uDQpUaGUgbmV4dCByZWFkIGZvciBldmVyeSBSTUlEIHdpbGwg
cmVwb3J0ICJVbmF2YWlsYWJsZSIgYW5kIHN1YnNlcXVlbnQgcmVhZHMgd2lsbCByZXBvcnQgdGhl
IHZhbGlkIHZhbHVlLiINCg0KPiA+DQo+ID4gICJtYXhfdGhyZXNob2xkX29jY3VwYW5jeSI6DQo+
ID4gIAkJUmVhZC93cml0ZSBmaWxlIHByb3ZpZGVzIHRoZSBsYXJnZXN0IHZhbHVlIChpbiBAQCAt
NDY0LDYNCj4gKzUzOSwyNSBAQA0KPiA+IE1lbW9yeSBiYW5kd2lkdGggZG9tYWluIGlzIEwzIGNh
Y2hlLg0KPiA+DQo+ID4gIAlNQjo8Y2FjaGVfaWQwPj1id19NQnBzMDs8Y2FjaGVfaWQxPj1id19N
QnBzMTsuLi4NCj4gPg0KPiA+ICtTbG93IE1lbW9yeSBCYW5kd2lkdGggQWxsb2NhdGlvbiAoU01C
QSkNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gK0FN
RCBoYXJkd2FyZSBzdXBwb3J0cyBTbG93IE1lbW9yeSBCYW5kd2lkdGggQWxsb2NhdGlvbiAoU01C
QSkuDQo+ID4gK0NYTC5tZW1vcnkgaXMgdGhlIG9ubHkgc3VwcG9ydGVkICJzbG93IiBtZW1vcnkg
ZGV2aWNlLiBXaXRoIHRoZQ0KPiA+ICtzdXBwb3J0IG9mIFNNQkEsIHRoZSBoYXJkd2FyZSBlbmFi
bGVzIGJhbmR3aWR0aCBhbGxvY2F0aW9uIG9uIHRoZQ0KPiA+ICtzbG93IG1lbW9yeSBkZXZpY2Vz
LiBJZiB0aGVyZSBhcmUgbXVsdGlwbGUgc3VjaCBkZXZpY2VzIGluIHRoZQ0KPiA+ICtzeXN0ZW0s
IHRoZSB0aHJvdHRsaW5nIGxvZ2ljIGdyb3VwcyBhbGwgdGhlIHNsb3cgc291cmNlcyB0b2dldGhl
ciBhbmQNCj4gPiArYXBwbGllcyB0aGUgbGltaXQgb24gdGhlbSBhcyBhIHdob2xlLg0KPiA+ICsN
Cj4gPiArVGhlIHByZXNlbmNlIG9mIFNNQkEgKHdpdGggQ1hMLm1lbW9yeSkgaXMgaW5kZXBlbmRl
bnQgb2Ygc2xvdyBtZW1vcnkNCj4gPiArZGV2aWNlcyBwcmVzZW5jZS4gSWYgdGhlcmUgYXJlIG5v
IHN1Y2ggZGV2aWNlcyBvbiB0aGUgc3lzdGVtLCB0aGVuDQo+ID4gK2NvbmZpZ3VyaW5nIFNNQkEg
d2lsbCBoYXZlIG5vIGltcGFjdCBvbiB0aGUgcGVyZm9ybWFuY2Ugb2YgdGhlIHN5c3RlbS4NCj4g
PiArDQo+ID4gK1RoZSBiYW5kd2lkdGggZG9tYWluIGZvciBzbG93IG1lbW9yeSBpcyBMMyBjYWNo
ZS4gSXRzIHNjaGVtYXRhIGZpbGUNCj4gPiAraXMgZm9ybWF0dGVkIGFzOg0KPiA+ICs6Og0KPiA+
ICsNCj4gPiArCVNNQkE6PGNhY2hlX2lkMD49YmFuZHdpZHRoMDs8Y2FjaGVfaWQxPj1iYW5kd2lk
dGgxOy4uLg0KPiA+ICsNCj4gPiAgUmVhZGluZy93cml0aW5nIHRoZSBzY2hlbWF0YSBmaWxlDQo+
ID4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICBSZWFkaW5nIHRoZSBz
Y2hlbWF0YSBmaWxlIHdpbGwgc2hvdyB0aGUgc3RhdGUgb2YgYWxsIHJlc291cmNlcyBAQA0KPiA+
IC00NzksNiArNTczLDQ2IEBAIHdoaWNoIHlvdSB3aXNoIHRvIGNoYW5nZS4gIEUuZy4NCj4gPiAg
ICBMM0RBVEE6MD1mZmZmZjsxPWZmZmZmOzI9M2MwOzM9ZmZmZmYNCj4gPiAgICBMM0NPREU6MD1m
ZmZmZjsxPWZmZmZmOzI9ZmZmZmY7Mz1mZmZmZg0KPiA+DQo+ID4gK1JlYWRpbmcvd3JpdGluZyB0
aGUgc2NoZW1hdGEgZmlsZSAob24gQU1EIHN5c3RlbXMpDQo+ID4gKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gK1JlYWRpbmcgdGhlIHNjaGVt
YXRhIGZpbGUgd2lsbCBzaG93IHRoZSBjdXJyZW50IGJhbmR3aWR0aCBsaW1pdCBvbg0KPiA+ICth
bGwgZG9tYWlucy4gVGhlIGFsbG9jYXRlZCByZXNvdXJjZXMgYXJlIGluIG11bHRpcGxlcyBvZiBv
bmUgZWlnaHRoIEdCL3MuDQo+ID4gK1doZW4gd3JpdGluZyB0byB0aGUgZmlsZSwgeW91IG5lZWQg
dG8gc3BlY2lmeSB3aGF0IGNhY2hlIGlkIHlvdSB3aXNoDQo+ID4gK3RvIGNvbmZpZ3VyZSB0aGUg
YmFuZHdpZHRoIGxpbWl0Lg0KPiA+ICsNCj4gPiArRm9yIGV4YW1wbGUsIHRvIGFsbG9jYXRlIDJH
Qi9zIGxpbWl0IG9uIHRoZSBmaXJzdCBjYWNoZSBpZDoNCj4gPiArDQo+ID4gKzo6DQo+ID4gKw0K
PiA+ICsgICMgY2F0IHNjaGVtYXRhDQo+ID4gKyAgICBNQjowPTIwNDg7MT0yMDQ4OzI9MjA0ODsz
PTIwNDgNCj4gPiArICAgIEwzOjA9ZmZmZjsxPWZmZmY7Mj1mZmZmOzM9ZmZmZg0KPiA+ICsNCj4g
PiArICAjIGVjaG8gIk1COjE9MTYiID4gc2NoZW1hdGENCj4gPiArICAjIGNhdCBzY2hlbWF0YQ0K
PiA+ICsgICAgTUI6MD0yMDQ4OzE9ICAxNjsyPTIwNDg7Mz0yMDQ4DQo+ID4gKyAgICBMMzowPWZm
ZmY7MT1mZmZmOzI9ZmZmZjszPWZmZmYNCj4gPiArDQo+ID4gK1JlYWRpbmcvd3JpdGluZyB0aGUg
c2NoZW1hdGEgZmlsZSAob24gQU1EIHN5c3RlbXMpIHdpdGggU01CQSBmZWF0dXJlDQo+ID4gKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ID4gK1JlYWRpbmcgYW5kIHdyaXRpbmcgdGhlIHNjaGVtYXRhIGZpbGUgaXMg
dGhlIHNhbWUgYXMgd2l0aG91dCBTTUJBIGluDQo+ID4gK2Fib3ZlIHNlY3Rpb24uDQo+ID4gKw0K
PiA+ICtGb3IgZXhhbXBsZSwgdG8gYWxsb2NhdGUgOEdCL3MgbGltaXQgb24gdGhlIGZpcnN0IGNh
Y2hlIGlkOg0KPiA+ICsNCj4gPiArOjoNCj4gPiArDQo+ID4gKyAgIyBjYXQgc2NoZW1hdGENCj4g
PiArICAgIFNNQkE6MD0yMDQ4OzE9MjA0ODsyPTIwNDg7Mz0yMDQ4DQo+ID4gKyAgICAgIE1COjA9
MjA0ODsxPTIwNDg7Mj0yMDQ4OzM9MjA0OA0KPiA+ICsgICAgICBMMzowPWZmZmY7MT1mZmZmOzI9
ZmZmZjszPWZmZmYNCj4gPiArDQo+ID4gKyAgIyBlY2hvICJTTUJBOjE9NjQiID4gc2NoZW1hdGEN
Cj4gPiArICAjIGNhdCBzY2hlbWF0YQ0KPiA+ICsgICAgU01CQTowPTIwNDg7MT0gIDY0OzI9MjA0
ODszPTIwNDgNCj4gPiArICAgICAgTUI6MD0yMDQ4OzE9MjA0ODsyPTIwNDg7Mz0yMDQ4DQo+ID4g
KyAgICAgIEwzOjA9ZmZmZjsxPWZmZmY7Mj1mZmZmOzM9ZmZmZg0KPiA+ICsNCj4gPiAgQ2FjaGUg
UHNldWRvLUxvY2tpbmcNCj4gPiAgPT09PT09PT09PT09PT09PT09PT0NCj4gPiAgQ0FUIGVuYWJs
ZXMgYSB1c2VyIHRvIHNwZWNpZnkgdGhlIGFtb3VudCBvZiBjYWNoZSBzcGFjZSB0aGF0IGFuDQo+
ID4NCj4gPg0KPiANCj4gQmFzZWQgb24gZWFybGllciBjb21tZW50cyBJIGFtIGF3YWl0aW5nIGlu
Zm9ybWF0aW9uIHRvIHVuZGVyc3RhbmQgaWYgc29tZQ0KPiBtb3JlIGRldGFpbC9leGFtcGxlIGlz
IG5lZWRlZCB0byBkZXNjcmliZSB0byB0aGUgdXNlciB3aGF0IGNhbiBiZSBleHBlY3RlZA0KPiBh
ZnRlciBhIGNvdW50ZXIgY29uZmlndXJhdGlvbiBpcyBtYWRlLg0KDQpQcm9wb3NlZCB0aGUgbmV3
IHRleHQgYWJvdmUuIFBsZWFzZSBjaGVjay4NClRoYW5rcw0KQmFidQ0KPiANCj4gUmVpbmV0dGUN
Cg==
