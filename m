Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581197B5D93
	for <lists+linux-doc@lfdr.de>; Tue,  3 Oct 2023 01:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjJBXLG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Oct 2023 19:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237135AbjJBXLF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Oct 2023 19:11:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310DBB4;
        Mon,  2 Oct 2023 16:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696288261; x=1727824261;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=okWSdgptZbgfEYZ5zqCIqj/xAh5TZmmZ9dLHfUr0t2Y=;
  b=NPxctaeFi5WeF5h822mdqh+Nq6y4hynMUnplwmFJ9K7Xd2dpmOeMocmG
   tH6W4W3SCwDkKeJ3CTtheDzFuJ8OireMneG7w9PfN2i98ydT4OCi6Ib9L
   MwROFDM3aKVpC5PuUKjZeiJerdywar1Wm0WTIrIg1IvEFTnUv2R5foJVs
   AA4+1we1gOCVufMUBzEr/ngBLox3h1FDrbsSIgU/n78AXwTOjOUDDUSXC
   1FQZ4HF8KbcmGLrgWYq9g12YNKp3y6vLJKilGLQoSBKIy1aPwBJ3aGbv0
   48DcgCXNMncm32YGTWi80KYk743d181Lo4pbyEhucSQFCRQ30N8lrYs6G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446921233"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="446921233"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 16:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816477553"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816477553"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Oct 2023 16:10:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 16:10:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 16:10:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 16:10:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 16:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+T6mZty9RljkA81bQXk6C2F3oipptTM4kBqpbDXbACZGuA40qtsvPNlAHtd0/orQezsTlZjz9RpkVlAoKUxATyJXMfr2z4yBydOewDnInj4mP2fpIUWGgIfSS9zbXg503QW18wALkKZKSVJzjHm3KB4F6jyJxuaJBdP1suo64monboZIIud6AfclO/zHnlBUXzaUE+WHgNNwT4v5WkZmxwQVVbKMiwfohaPgxjRFC9EmT+eAzAXrVJjIb0cih2FecozOzUcyDyGMGDOvJuw3A/6GTCvpL3fYeyxjjKcHWfeJ6fTowy8ZDcqPEFgcTk6oXYsUXkBzN1kezAbSITWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2k8Kv7gDK8QYvc+191JSKWQCfNduZLnosnx/JxMRo4=;
 b=kHTyqvLIFy7HwI0Y9yGpppIVcK2k564Ytm3V8ck6PsVM+cwn0njtylRWCH70bhVIRDlbrH3FWtsDE3hNwDkcGRm+wExgqkmSdAjYCZ1SrtE1M/6LVr9TzGh1F0y7gibndEQmDZIheW9/Utkn1EHgXdPQT42J6rcIzhHletJXWFkw7XTHvE7tdLzuODdt+Q+NNKqXZyqzq9SgTPgdhjIGmlPr/OAV/C+JysBYZvwvpFcZzeGa2d5ybbRM3AAO4F4OL5jMWZZrCIGSoqzkxPHFIDxFWK8YErVdPgWDnJ43M3nLN8SAgAFQG1npxNGY5znOAv9iX+liG7g0vasN6jK4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) by
 CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 2 Oct
 2023 23:10:39 +0000
Received: from DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::4c69:ab61:fea5:5a7f]) by DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::4c69:ab61:fea5:5a7f%3]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 23:10:39 +0000
From:   "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jiri Pirko <jiri@resnulli.us>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "davem@davemloft.net" <davem@davemloft.net>
Subject: RE: [Intel-wired-lan] [PATCH net-next 3/4] dpll: netlink/core: add
 support for pin-dpll signal phase offset/adjust
Thread-Topic: [Intel-wired-lan] [PATCH net-next 3/4] dpll: netlink/core: add
 support for pin-dpll signal phase offset/adjust
Thread-Index: AQHZ8STYBdXle/Bxd0eyxPCX/7DD6LAu+R+AgAebAaCAAA0FgIAAAWUAgAB1LQA=
Date:   Mon, 2 Oct 2023 23:10:39 +0000
Message-ID: <DM6PR11MB4657DB3C9BC3E1EFE6A2F3389BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
 <20230927092435.1565336-4-arkadiusz.kubalewski@intel.com>
 <4018c0b0-b288-ff60-09be-7ded382f4a82@linux.dev>
 <DM6PR11MB4657AA79C0C44F868499A3129BC5A@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZRrb87drG7aVrxsT@nanopsycho>
 <eb019ccf-c50b-e9d7-e4e6-f6574f805b49@linux.dev>
In-Reply-To: <eb019ccf-c50b-e9d7-e4e6-f6574f805b49@linux.dev>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4657:EE_|CH3PR11MB7297:EE_
x-ms-office365-filtering-correlation-id: 6685615b-acb9-4a59-a2fc-08dbc39ccb5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uLTpsQKXjUv7SwzdJyalMq89Vsgkp7DCzsGjXMelikaE1MObzNn7kAH1oYr7fMrbKI9DxNL7FUVcsznH8VrPnr2RXcQFjdKNUggovhBsTZHRD4Y2ENH9QIBwzc2FKhQR5VxsGELSiXTIjlgidGmUsRd6n07pBns2chqqHUrRPNWXWfxP5/J7ECbAsv1qsWaPnxTnZISzYai8uvNwYkXbsE9aDP0hSGo++2qprG6BusG3Rp5yGns9Cpasjav+t33By55qbw7u0q5Ua/pzgKC2X3sQshverTcY3RoIf3KULUpgFeoK08rOKQYOVaaN3sWqRYzMQRHV1RrPavwy+HSX+2AfGQJfS+PC9BnNHNS242KYIFLlxHFgOOMzegTo720Ab2OPknkg/luNb3w1pRB1IghEMoGWR5w0zT3CUJd2wjOJTsBdxMaIhmdusXmbPrVsVTOHm1zUq4UoMHJeHtETdATsB62P/Up2awb6ZOzGieQTpiiRGobDihuuwAJmZtuxq2bo2J+O0HqYu2yZ9woBRo2z/lHLrNrGbS4Li7Uqwmg1K+NkhymsZjxr2Zy7ksWB3ktpTUs3Iy2f6VQQR4WuJCtJ6thWb1mqEqK2Ub1nqr4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(478600001)(71200400001)(6506007)(53546011)(7696005)(9686003)(2906002)(83380400001)(110136005)(66946007)(66446008)(41300700001)(316002)(76116006)(66556008)(66476007)(52536014)(5660300002)(8676002)(4326008)(64756008)(8936002)(54906003)(33656002)(86362001)(38100700002)(122000001)(38070700005)(82960400001)(26005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z9zrB32Coyl4vgDe3ig781UnAApz8yMdb401vpY4PHYxMZpC4B/mkPIpGe0U?=
 =?us-ascii?Q?dqQo3bouGPC09ICVRKKYRuO6dgl7gmD+0wnKpJifQCtZKjJ+ajUYPycIHMl5?=
 =?us-ascii?Q?ZeRimPugNK7Po1IebByV3mXFZj9L76tVC7AQFbtwgsdeqK4Y39X7VDb18jzy?=
 =?us-ascii?Q?Ggkmpy5e4MDt6hE+sWWgn8YsgkTVkFVroNtJqyhRlIFHHeUGovewGeoUVdsQ?=
 =?us-ascii?Q?sPQWYVv9554rAOR6xpCJ8FXrdWOlH2UMDEtUbV2TmN175iKslb0bSan4BznU?=
 =?us-ascii?Q?cnHwPnQkbyHp62HcvTnLMqXUhCWE4aSzZwTGdaOFuFDPehKr9jAX4bWaGiiL?=
 =?us-ascii?Q?o5996qsd5NVH9FO/Un4zc5UGlBG32bPSX2+NOQloAqqGBAqmpfmOlVARk32Z?=
 =?us-ascii?Q?gIoY6hUv3bE9QeKuVH5LK45Xy8n934MrYSlf09EM/2bjuM54lsIQT1L7lnV0?=
 =?us-ascii?Q?JUudPemdVe2ypz2C9ltDxQZslpe6gjr6LPvv9druTLM9AuDlqqIvtgOOYqOQ?=
 =?us-ascii?Q?nYohJ6z6SPsKt/Njexpnqt79Wc20tt380a6uhw97vUIcqTb70l9NYb9rlZ7g?=
 =?us-ascii?Q?YFpQpRfGeY/qyKl1P4s6QmRz21v3RyYvHs2NwUZWYthrtEaZHMywRAhK8HBL?=
 =?us-ascii?Q?ZRYqI6VKrUAV9ue9KD/921kexw47tMcUBdj2G5EB+yyR51iNGxDYKRWvjgqT?=
 =?us-ascii?Q?jaIf0+mSWW9w9WSMOQ4GG6TU/zT+bH2vw5vsLIzMozvnCOpw+hbE8ft7FNz0?=
 =?us-ascii?Q?Y1udurvKgsTNuiT+3cqOz5EYi1uVpZDqMgpm1Pqq/FtSbBR+Qb1Mc3JhhR+Q?=
 =?us-ascii?Q?8MJ6lIRME50tZ/QGY+PwfvbI/NdbBaUakr6zYI4UuDW9vvyUxFIfJrGzpV46?=
 =?us-ascii?Q?e64FJDc0W3VJo7b8ZyWTbrJGH/K100wQz5nBdpjCsKf22OmHIU6Fpzw9WWIu?=
 =?us-ascii?Q?urgwf0FJ6Hpq4Hch/vy+Ft6b+8EltonV5uP0mfKSycqekqGVhaEZVl+vXZhs?=
 =?us-ascii?Q?wSwQ69wyxACCGOHx+DyUg/8JJ1kGY0TNtgJFrrP5Zqdr7TxVuD4aaA2l+0/v?=
 =?us-ascii?Q?NlvKe/eoQ2ic6uVTVSFxRnmmTo2h9FlbA62aj/Y7RI+I8ZEKbOCOlEXTUwam?=
 =?us-ascii?Q?MNjZGaZ9/DuK/7y3fOgxwWeVraJ9CGJ9HRHNHb2qJObkkA5/T0q+AqtS1Y++?=
 =?us-ascii?Q?o9PPFQ1DqDgGAZhVd0GtmgMA0VQvjBJ9pcHIOCZixX/XEG+oOuHFN42qIosp?=
 =?us-ascii?Q?RCyXK7pNxTm7c4kU1C6OfEJQgxuh8l5cCxXNO4ZBrzWpP4OybjNoAUaW7Sz9?=
 =?us-ascii?Q?JUHefDFcvN+vKCvxXfhcC/AQJ42WQuQ3j3tZNINc+oJSz3RqFJhpz10IgpRl?=
 =?us-ascii?Q?38Gl560+9+YjjEkGJZO6iMg1wEWSVfbYWppCoaSEDDmkS0I++bTjpRLnodYc?=
 =?us-ascii?Q?61Zxv3e0l5UfLPTucKoZPUS8+i/5kaDb9MFdlmlZOjUKAXf4R1zHBo9RWQXy?=
 =?us-ascii?Q?jKWgwkxqjs883Ikw02xGGKL+TqusKg7Q2TK6F94JWMHcxG4g4DmYV6xzslbw?=
 =?us-ascii?Q?f4dzZXbWtTDr4RTpZk/I3OY987XD/55HdYHqXBzq0GxH+cFTibjbxJpJVCln?=
 =?us-ascii?Q?rw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6685615b-acb9-4a59-a2fc-08dbc39ccb5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 23:10:39.7090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNcLdJsrfMs2rxPtK4UBzj8R0MhRMU8a6822gxv4YX1311JOSQ2w8/2dOTv1UHeqCMz5HfsfpWc3CUWaGOnrxw9uvYncyuiAASvqOnBzO8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf Of
>Vadim Fedorenko
>Sent: Monday, October 2, 2023 5:09 PM
>
>On 02/10/2023 16:04, Jiri Pirko wrote:
>> Mon, Oct 02, 2023 at 04:32:30PM CEST, arkadiusz.kubalewski@intel.com
>> wrote:
>>>> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>>>> Sent: Wednesday, September 27, 2023 8:09 PM
>>>>
>>>> On 27/09/2023 10:24, Arkadiusz Kubalewski wrote:
>>>>> Add callback op (get) for pin-dpll phase-offset measurment.
>>>>> Add callback ops (get/set) for pin signal phase adjustment.
>>>>> Add min and max phase adjustment values to pin proprties.
>>>>> Invoke get callbacks when filling up the pin details to provide user
>>>>> with phase related attribute values.
>>>>> Invoke phase-adjust set callback when phase-adjust value is provided
>>>>> for
>>>>> pin-set request.
>>>>>
>>>>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>>
>>>> [...]
>>>>
>>>>> +static int
>>>>> +dpll_pin_phase_adj_set(struct dpll_pin *pin, struct nlattr
>>>>> *phase_adj_attr,
>>>>> +		       struct netlink_ext_ack *extack)
>>>>> +{
>>>>> +	struct dpll_pin_ref *ref;
>>>>> +	unsigned long i;
>>>>> +	s32 phase_adj;
>>>>> +	int ret;
>>>>> +
>>>>> +	phase_adj =3D nla_get_s32(phase_adj_attr);
>>>>> +	if (phase_adj > pin->prop->phase_range.max ||
>>>>> +	    phase_adj < pin->prop->phase_range.min) {
>>>>> +		NL_SET_ERR_MSG(extack, "phase adjust value not supported");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +	xa_for_each(&pin->dpll_refs, i, ref) {
>>>>> +		const struct dpll_pin_ops *ops =3D dpll_pin_ops(ref);
>>>>> +		struct dpll_device *dpll =3D ref->dpll;
>>>>> +
>>>>> +		if (!ops->phase_adjust_set)
>>>>> +			return -EOPNOTSUPP;
>>>>
>>>> I'm thinking about this part. We can potentially have dpll devices wit=
h
>>>> different expectations on phase adjustments, right? And if one of them
>>>> won't be able to adjust phase (or will fail in the next line), then
>>>> netlink will return EOPNOTSUPP while _some_ of the devices will be
>>>> adjusted. Doesn't look great. Can we think about different way to appl=
y
>>>> the change?
>>>>
>>>
>>> Well makes sense to me.
>>>
>>> Does following makes sense as a fix?
>>> We would call op for all devices which has been provided with the op.
>>> If device has no op -> add extack error, continue
>>
>> Is it real to expect some of the device support this and others don't?
>> Is it true for ice?
>> If not, I would got for all-or-nothing here.
>>
>
>But nothing blocks vendors to provide such configuration. Should we
>rollback the configuration? Otherwise we can easily make it
>inconsistent.

Good point, in such case rollback might be required.

>
>I'm more thinking of checking if all the devices returned error (or
>absence of operation callback) and then return error instead of 0 with
>extack filled in.
>

Well, what if different devices would return different errors?
In general we would have to keep track of the error values returned in
such case.. Assuming one is different than the other - still need to error
extack them out? I guess it would be easier to return common error if there
were only failures and let the driver fill the errors on extack, smt like:

	int miss_cb_num =3D 0, dev_num =3D 0, err_num;

	xa_for_each(&pin->dpll_refs, i, ref) {
		const struct dpll_pin_ops *ops =3D dpll_pin_ops(ref);
		struct dpll_device *dpll =3D ref->dpll;

		dev_num++;
		if (!ops->phase_adjust_set) {
			miss_cb_num++;
			continue;
		}
		ret =3D ops->phase_adjust_set(pin,
					dpll_pin_on_dpll_priv(dpll, pin),
					dpll, dpll_priv(dpll), phase_adj,
					extack);
		if (ret)
			err_num++;
	}
	if (dev_num =3D=3D miss_cb_num)
		return -EOPNOTSUPP;
	if (dev_num =3D=3D err_num)
		return -EINVAL;
	__dpll_pin_change_ntf(pin);
	return 0;

??

Thank you!
Arkadiusz

>>
>>> If device fails to set -> add extack error, continue
>>> Function always returns 0.
>>>
>>> Thank you!
>>> Arkadiusz
>>>
>>>>
>>>>> +		ret =3D ops->phase_adjust_set(pin,
>>>>> +					    dpll_pin_on_dpll_priv(dpll, pin),
>>>>> +					    dpll, dpll_priv(dpll), phase_adj,
>>>>> +					    extack);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +	}
>>>>> +	__dpll_pin_change_ntf(pin);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>
>_______________________________________________
>Intel-wired-lan mailing list
>Intel-wired-lan@osuosl.org
>https://lists.osuosl.org/mailman/listinfo/intel-wired-lan
