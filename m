Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C713C5F0AC2
	for <lists+linux-doc@lfdr.de>; Fri, 30 Sep 2022 13:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbiI3LkT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Sep 2022 07:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiI3Ljy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 07:39:54 -0400
X-Greylist: delayed 3347 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Sep 2022 04:32:02 PDT
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net [46.105.63.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBEA166482
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 04:32:01 -0700 (PDT)
Received: from player761.ha.ovh.net (unknown [10.109.156.77])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id D1E7F2570A
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 10:35:15 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player761.ha.ovh.net (Postfix) with ESMTPSA id 9A26B2F2FF57A;
        Fri, 30 Sep 2022 10:35:11 +0000 (UTC)
MIME-Version: 1.0
Date:   Fri, 30 Sep 2022 12:35:11 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Update the sysctl/fs documentation
In-Reply-To: <20220930102937.135841-1-steve@sk2.org>
References: <20220930102937.135841-1-steve@sk2.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <002664f794c712a55223abeb67316765@sk2.org>
X-Sender: steve@sk2.org
X-Originating-IP: 82.65.25.201
X-Webmail-UserID: steve@sk2.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14295269643360175750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeekhefgkeejieejgfevjeduveejkeegffdvtdejhffhteehvedtvdejjedvueeikeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejiedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeh
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Le 30/09/2022 12:29, Stephen Kitt a écrit :
> Changes since v2:

Aargh, changes since v1 of course.

Regards,

Stephen
