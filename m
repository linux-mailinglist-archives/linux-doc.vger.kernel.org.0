Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50049618315
	for <lists+linux-doc@lfdr.de>; Thu,  3 Nov 2022 16:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbiKCPnL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Nov 2022 11:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbiKCPnH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Nov 2022 11:43:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C256B1B1DA;
        Thu,  3 Nov 2022 08:42:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 383A861F34;
        Thu,  3 Nov 2022 15:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A648C433D6;
        Thu,  3 Nov 2022 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667490174;
        bh=PmqtbmT9mQWma23ymagJ11tWufGstamjMkYv5eb/5qo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P02zYSj2EXx8UFjhs0W38mcmH7PPhDxFrPAs3DIwwhe6kVMB5ibwdAun3jGpCY3Y0
         M08VVoWub2n2hyrhtGRR+mmykQmLuUjOx4UNjXm1UNFay342V8GGHmWoTpGWxiOaKH
         u+Nb3RWExGgZHx0Tie5GDON9iPIaNrOz4o0S9sKqUM9AYwtKKEWBOLvdCL2C47/yYX
         1ooW7JvbX5/t0zVJf1DccEtvFvn2k/ObkEawkO86X17x3V2vSX8ofZ2bXJYj+hwaqZ
         HLWQU546DfPaovhrx6xD/ATmcTYzFxi1OLvcUMh6DrdUDLb+OUf+r9/r10eCBExuhV
         v6tNjRSjvqybA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1oqcMm-003Xt1-3n;
        Thu, 03 Nov 2022 15:42:52 +0000
Date:   Thu, 03 Nov 2022 15:42:51 +0000
Message-ID: <86fsf0qc1w.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Usama Arif <usama.arif@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        steven.price@arm.com, mark.rutland@arm.com,
        fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com
Subject: Re: [PATCH] kvm/arm: Fix pvtime documentation
In-Reply-To: <24d81fe9-7cd1-71eb-8c35-0739f638b3df@gmail.com>
References: <20221103131210.3603385-1-usama.arif@bytedance.com>
        <24d81fe9-7cd1-71eb-8c35-0739f638b3df@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: bagasdotme@gmail.com, usama.arif@bytedance.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org, linux@armlinux.org.uk, yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com, mark.rutland@arm.com, fam.zheng@bytedance.com, liangma@liangbit.com, punit.agrawal@bytedance.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 03 Nov 2022 13:55:29 +0000,
Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
> On 11/3/22 20:12, Usama Arif wrote:
> > This includes table format and using reST labels for
> > cross-referencing to vcpu.rst.
> > 
> > Suggested-by:  Bagas Sanjaya <bagasdotme@gmail.com>
> > Signed-off-by: Usama Arif <usama.arif@bytedance.com>
> 
> This is not what people normally do when given suggestion diff like
> what I sent before [1]. Instead, they just apply and squash the
> suggestion (while also applying requested changes from reviewers).

No, this is the correct course of action. There isn't any point in
having an *unrelated* change in a separate series. This is a
standalone change, posted as a standalone patch.

> Please reroll your series [2] with suggestion applied.

Or not.

	M.

-- 
Without deviation from the norm, progress is not possible.
