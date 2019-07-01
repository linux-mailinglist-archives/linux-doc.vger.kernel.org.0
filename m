Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042703860A
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2019 10:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbfFGITO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jun 2019 04:19:14 -0400
Received: from mail-eopbgr1400105.outbound.protection.outlook.com ([40.107.140.105]:32576
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727021AbfFGITN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 04:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/Y0FQnRXNdESqRRq1Kn4ne96vnW4kohRKiZPMqJHAo=;
 b=Xhhu7QeBGtX/Z+SuptZsQNvPvijp0OM6oww/qIdz3orlIYpa8Yi2ojcF9OQbSbzavricadPUJKUVNBtxESTkccAzPZhSCNaQSIlABa3wRflWMfqiAH0TR3OI58b3rPNt5URGZMa14jzNQGLUYZpk7x3NBhPPY5OZmzffVD4T/YI=
Received: from TYAPR01MB3102.jpnprd01.prod.outlook.com (20.177.103.73) by
 TYAPR01MB4863.jpnprd01.prod.outlook.com (20.179.175.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 08:19:09 +0000
Received: from TYAPR01MB3102.jpnprd01.prod.outlook.com
 ([fe80::4c13:4e4f:c7ac:9f6e]) by TYAPR01MB3102.jpnprd01.prod.outlook.com
 ([fe80::4c13:4e4f:c7ac:9f6e%3]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 08:19:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "jroedel@suse.de" <jroedel@suse.de>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH] Documentation: DMA-API: fix a function name of
 max_mapping_size
Thread-Topic: [PATCH] Documentation: DMA-API: fix a function name of
 max_mapping_size
Thread-Index: AQHVHQX28aIqCA/T0kKXQB70i48QjqaP1kMAgAACTBA=
Date:   Fri, 7 Jun 2019 08:19:08 +0000
Message-ID: <TYAPR01MB3102C6CCC204DAAA6570FD25D8100@TYAPR01MB3102.jpnprd01.prod.outlook.com>
References: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190607080814.GA10303@lst.de>
In-Reply-To: <20190607080814.GA10303@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ca70c39-69e5-4f79-c412-08d6eb20d0aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4863;
x-ms-traffictypediagnostic: TYAPR01MB4863:
x-microsoft-antispam-prvs: <TYAPR01MB486321076DBF2C7B8B042C87D8100@TYAPR01MB4863.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(6436002)(54906003)(316002)(6506007)(7696005)(33656002)(68736007)(53936002)(102836004)(6246003)(66066001)(6916009)(66946007)(64756008)(66446008)(4744005)(71190400001)(66556008)(99286004)(5660300002)(81156014)(66476007)(71200400001)(256004)(81166006)(14444005)(52536014)(74316002)(8936002)(8676002)(76116006)(73956011)(25786009)(9686003)(55016002)(486006)(4326008)(76176011)(6116002)(14454004)(26005)(446003)(3846002)(7736002)(2906002)(86362001)(305945005)(229853002)(478600001)(186003)(11346002)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4863;H:TYAPR01MB3102.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZkXewv06J4V5qfmMQgARQzIJqbF+0G2Yb8BsVhp4ZpZyjCWyt8sGm0+USdJOHyu5+phT5kmWtqy34PjQIptXmJyw822+8mcpKBmC2CFz4Jeajvnxm3rlSj9PeJfU1v6snCbFTgFtjZtVo3dImp9td8uoS6e+uBEdW+GpfJRY0p7teuOJarvrFbT3Dy/6AUJbAHhPfQuRA17pgoZFDd8UJWg6PalkskGHDfNQQ5kYkRRgyo3PsSQ3x8qiNUgWIl+ED2irgHa7wWTjea87cW0SeL34lNwExV8CIXibiunLXx8Znb0Z6GoYOLjQAf2+WrmD3JkXgxCDq/F6XNXhkzf0E5BYPCWQfaAPGCd7x0Z7T6Wl7CsvMj9P9VLlIALBdE9JruOZsw5y1MQIBnG/+/ayYUCrxfZx51Dm5moEe9X+jlU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca70c39-69e5-4f79-c412-08d6eb20d0aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 08:19:09.0747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4863
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Friday, June 7, 2019 5:08 PM
>=20
> Looks good.  And it seems like you've also found the solution to
> your usb storage problem, but I'm going to post the variant I just
> hacked up nevertheless.

Thank you for your reply! I think this API is related to my problem,
but I don't have any actual solution (a patch) for now. So, I'll wait
for your patch!

Best regards,
Yoshihiro Shimoda

