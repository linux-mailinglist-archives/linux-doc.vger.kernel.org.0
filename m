Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B467E7BEE95
	for <lists+linux-doc@lfdr.de>; Tue, 10 Oct 2023 00:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378937AbjJIW4C (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Oct 2023 18:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378784AbjJIW4A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 18:56:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C1AA7;
        Mon,  9 Oct 2023 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696892159; x=1728428159;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EAogbdI7XEdWVAqbuUjuiiJ0pJf5B8vFc0Wc0ZX+Kfw=;
  b=AIqlo6dFayLwfiJNI9wkvJS8xn6q9JcIzv3VdgPz3qXZPsi1Te6Ugjgd
   0m+u5KdFSYzpewlZ8hDpHKPfJmo3TSlHAKMLwQk3KInbIlUXd+t6idMAj
   Yf28jBgZ3upqEKki7PvceEyVRqjyhyv1LBUJm5nAAygGjvZVZOnPTg9wA
   Ai+/Ops0ur9u1vzKSjkvH4gOU+ce+qCprf6QBMpJYIoNgWCZF3iCUjejN
   rnkd9SpaQWLzyQhjGDKf2ihRJWXaI0dfXV8Lcsfu5n7xbIsS8ZIoRb0Db
   NSfPxC5WsXya/0pXEjfK33eLqBeDu9AGJVW+oVOhcFuxZ1NevwT93m25b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388134156"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="388134156"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 15:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869437860"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="869437860"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 15:55:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:55:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:55:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 15:55:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 15:55:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHWmNWz88U6ZoqSjySh5KRVuQajltM1Mzuilm9t6F3Y+PPN2a1S1pXSIyEDz4WovpQaa41WAKLaCHOAOXXmUOBSTAKbWpt17xph5JuJ5194D9EM57PGAf0QK+uc0m6p79mjptYKxuz62w/vsq+8HO+z8HgU+Do5MnZFGoHee7yJx4ql1jpx0M0Q6HWyseWVuQ/N4EnbyxLKK5147sRvtmF3A/fFruNYkWEI2vuXYZCrEesolP/L+Rtzk8Zy2nEoZ83WAvtMWZqBTR1N/whbhHJObrzZ528LFy2YqCZ/WxLcDRt1s8mEnUZGhWjxG45+/3O1RECGzK1esO0yqVGDoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZK5hV9vu8ai8kwnttVRjScOF9ewqHfojexLXbA3HEhs=;
 b=XzyI16AMWom/EqoX56cIETv8KUOuMAV7+aK52l7YCe2aDEd6uDDk9AxTml3nPXhFwJMGs0Br+mXOBoWAwiNpm01pnE4ea2/+PjqzkoXCT1vJN3hCRIvGqy9RJkc0O/AMbJaq+1QKZGxkFU4fwTu1ASwKC3ssfnfqei0t42FxQnSab21ribIJc62Z1INTFlVtP2VGol4CCGm8xNP0RVrGG6r/5cZq491vMlLTRYuNCDX2zw7mo2suyRhb/KsFTiVtkMuqtzCuCdPu0ApQlxll7R0a7+ZM8xYpXm1QPLzPRvgPn8N+a8/cgQh9uxTU+jrHkFyVp3D+ZiXC1FR10IWZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) by
 CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Mon, 9 Oct 2023 22:55:52 +0000
Received: from DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::4c69:ab61:fea5:5a7f]) by DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::4c69:ab61:fea5:5a7f%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 22:55:52 +0000
From:   "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
To:     Jiri Pirko <jiri@resnulli.us>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
Subject: RE: [PATCH net-next v3 2/5] dpll: spec: add support for pin-dpll
 signal phase offset/adjust
Thread-Topic: [PATCH net-next v3 2/5] dpll: spec: add support for pin-dpll
 signal phase offset/adjust
Thread-Index: AQHZ+Epmg7phnTS/TkKDwNu8gB4oQrA8sRAAgAVlg6A=
Date:   Mon, 9 Oct 2023 22:55:52 +0000
Message-ID: <DM6PR11MB46577C12ABC1AE8B8BF743719BCEA@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20231006114101.1608796-1-arkadiusz.kubalewski@intel.com>
 <20231006114101.1608796-3-arkadiusz.kubalewski@intel.com>
 <ZR/9yCVakCrDbBww@nanopsycho>
In-Reply-To: <ZR/9yCVakCrDbBww@nanopsycho>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4657:EE_|CY8PR11MB7897:EE_
x-ms-office365-filtering-correlation-id: 298d3878-19e8-4f50-91f4-08dbc91ae36d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4qNrRlbHivpf+daFJ5C/bWzs21Ik43NJxQxH3KNPIWrUp8lgK3XSH4qUPuuoo4xCbWKfDwSpN3Oja/buRjAZUL8yKGLDkJa+nJ+0oQFVj2LuyLzw424ZZ2qyxjgjxEYcd4mfU6P7EEBcJCZAFQhT7b3VWuPkKAjiMIduAVZT4ToYT9ccvkjEGqJvZ0g26QbFrYGK+mo1e3bJHwLIkHOPuEw1scBsoksl/X3kLCiJmlaHU29OjiLE8kIqxQmh7HKHl2lGQagDJocZaQJZfMQBXMyn+Ks3YpqZ4MQxzizAUI411IyRq7b0ZeX2w3hGc9poiCF8DezlgcEorPzYQzq8HB+IDhB0znGWTkWBGnYvcFroqWUhnui830r/1itQA6V5aFISPAIFAKZnLxehi7B44fER4MLHfBKdYaFXJlCYF+JA2zP1kxPt7c93bjV4kGtTd0EXzRJDLMfByU4BY8Yp2rRQS8Pil2N1KVwXBc7JoHPkgo7WhEVjJJF7Pn8B6jYC0rAI7hBOQoDSULkliwj/Zz5yuat7kbQ1uvmVBBAMeEbSKXNRyh3qR1xNCjSldRLTBCanCN1PwU1I/AT0yGc+y7ZeH8yoPicGUk+t7dIPOOJOiUg9inRfJNQ7bykCckfN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(83380400001)(76116006)(26005)(54906003)(66556008)(66476007)(6916009)(66946007)(64756008)(316002)(66446008)(4326008)(5660300002)(8676002)(7696005)(41300700001)(6506007)(71200400001)(52536014)(2906002)(9686003)(478600001)(8936002)(33656002)(122000001)(82960400001)(86362001)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X9Qv7XPZXg3hxCzBTORIDtWax2EIYj7pKLzKr6Kzrum2MXk/hL9/C1pV3hJV?=
 =?us-ascii?Q?eJqGxW1foBznW8hmFpCizpmZhzzYMjOpSjgNM6GBihX2m/jjUXch24upZhau?=
 =?us-ascii?Q?eK+vcKkts6tAhcbfyQnRIQd4WsU3wRP6zRVq/HCMX9AZLrwgbaFjObN+P9Sv?=
 =?us-ascii?Q?TyJhvKI0fDN/VDhwsePq8byzka48LqEpqvWFoHYJ5dkXMd8ftBU8BM5K8UQ2?=
 =?us-ascii?Q?j8SugkNdTIJ8QevthOT2Hcm/nFRgeCzVMRIwlJqHs3rsWusiTFwkIZH6/78R?=
 =?us-ascii?Q?tH+AL9LaDGH/GeedjWS+ocZoX1R8jRReIzES8wwt2SlianX2k9Ad5AHSe7+6?=
 =?us-ascii?Q?atrex3AgzFGEtSKKzzrgnx6BluOAmCLRdsizUgNNkcEqZORc0Om+DOc+Xdtb?=
 =?us-ascii?Q?/NBfz90LTXrVj33H9k3JQBSenYfLF+kmBY8zMtMw0It4WtctO+6EOcpG0CHZ?=
 =?us-ascii?Q?4h/pExLBrRDu0kpxACD9k0XnSKT89sGOiPZu2W/37awEYvOaIgfrEnI8JsHH?=
 =?us-ascii?Q?JiwGevn7f2FwRbJlV89DWOzAJBoNioKVHsCWb0uem2J4AKJPn+kOGRyQdCe9?=
 =?us-ascii?Q?/8K+GvrP+XhxMcSc0aEjAJCWsWHcd9yQytwTrKglCvLHSB8MbBEyiVdr5aYf?=
 =?us-ascii?Q?tEd+3yBHH8k5zKE6gKAZ4EPLpKl+vbvtPV7W/BwWODonCxTNx/CbawPgewmK?=
 =?us-ascii?Q?Ly0/7fkpJE8Ll/KU0IKYjf2+VsNzovtmL2M3L2SVVY/4AzCooLMiliKoh8N2?=
 =?us-ascii?Q?DsPmQgRHtbHdgR/AqbwM6+RP69I2D0wX8X3oXst5xJiAJlMIR4OZfarGj9Lr?=
 =?us-ascii?Q?rCi7BzZ2OuaQKYB7dyBi9Wf/8hhvMOTDS7KT2JjpWf/FQtpDRvn9l3FK1A3y?=
 =?us-ascii?Q?JLicBlHkP8AjFo4R09wcmijEbA9bURukXjdegFjkf3BC28DoZc4IRJSjYmHT?=
 =?us-ascii?Q?4u9kYBgsVbFzP3MLGJ0bg6Tw6lzhSW1V5FW6tGRUNLfc+tAqbORjUC9pTV5E?=
 =?us-ascii?Q?UYHEVIkJ38caYnUpMkoNJ7n83Dyyj7+GRrsY+QN/vadgfUBmINB3m9Tls1tM?=
 =?us-ascii?Q?qbN3TlJRZYScgO4oVmsFdazW7TTYJRHuhglQPu1LEW5iD7NSaz66LhiIr5kD?=
 =?us-ascii?Q?xPYCgyD5/zh5zmXEv0LfOxv//uj1j6hwhqBRmTVRVlI5YBtbfhsxOxOh9G9g?=
 =?us-ascii?Q?lfsL5oRRG1pRO66iyJiiOFeS6NwBNQJ63vqgTwqdSVSgcIPoJMQtPj4jTd/1?=
 =?us-ascii?Q?QWkZdC5vvosVeO3p2LQ3Usyh6EJjWG5PpPGhbZ7dsJzJ5nNuqQ1Y3qF7XcZO?=
 =?us-ascii?Q?GsuNfPYu05vA0lgTqJ/YQRd3X0CyszVP6jlwbzPhb7N19HQyooQfofdLt8B9?=
 =?us-ascii?Q?qNzKJszdTkEYBK4CtHT7okRwyFsQMMPuIQ2ew9Tc8kcRCe3Cc0wGA/nGrNzf?=
 =?us-ascii?Q?b/I5sDVSTb58TlHh8lNmwNSI+modfGPcy88JaO7d9Pv10u8dw+r+6CInWTjT?=
 =?us-ascii?Q?PvAJfQ8mzYSte7RvA+8WPmNwUQ+RaT/+yXpo7dDsC+WgPtxtqGJDhlLli4R8?=
 =?us-ascii?Q?B5D4d7PIS7MM/x088kjtDUBVzRlZf5GP8dXQ5Bg5/42qNeMYLe+3WE91AlZV?=
 =?us-ascii?Q?9g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298d3878-19e8-4f50-91f4-08dbc91ae36d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 22:55:52.4781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/D2ge8dYBeR8jzMfVq7V+ONyQlD4pwDvsxDwfQJRVXYFmOybmXNjUXverh5vozG3BuBb6otp4Zrx0JaeiZPVjW3jSlPQdVaqzbPgCS98Vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
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

>From: Jiri Pirko <jiri@resnulli.us>
>Sent: Friday, October 6, 2023 2:30 PM
>
>Fri, Oct 06, 2023 at 01:40:58PM CEST, arkadiusz.kubalewski@intel.com wrote=
:
>>Add attributes for providing the user with:
>>- measurement of signals phase offset between pin and dpll
>>- ability to adjust the phase of pin signal
>>
>>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>---
>> Documentation/netlink/specs/dpll.yaml | 33 ++++++++++++++++++++++++++-
>> drivers/dpll/dpll_nl.c                |  8 ++++---
>> drivers/dpll/dpll_nl.h                |  2 +-
>> include/uapi/linux/dpll.h             |  8 ++++++-
>> 4 files changed, 45 insertions(+), 6 deletions(-)
>>
>>diff --git a/Documentation/netlink/specs/dpll.yaml
>>b/Documentation/netlink/specs/dpll.yaml
>>index 8b86b28b47a6..dc057494101f 100644
>>--- a/Documentation/netlink/specs/dpll.yaml
>>+++ b/Documentation/netlink/specs/dpll.yaml
>>@@ -1,7 +1,7 @@
>> # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR
>>BSD-3-Clause)
>>
>> name: dpll
>>-
>>+version: 2
>
>I'm confused. Didn't you say you'll remove this? If not, my question from
>v1 still stands.

I am just moron who have sent wrong patch :s
Now is fixed in v4.

Thank you,
Arkadiusz
