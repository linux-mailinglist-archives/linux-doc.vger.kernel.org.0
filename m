Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41EE754541C
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jun 2022 20:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbiFIS0e (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jun 2022 14:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbiFIS0e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 14:26:34 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10B340A23
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 11:26:29 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7FAE7732;
        Thu,  9 Jun 2022 18:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7FAE7732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654799189; bh=/7QwCzWnCrXcq1P11ptTjBk9y45KYu6ZacxmBt1pfFI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VncFSKAFeJ/rPxIBIsOOl4ORC+PwBncpinttLb3fQxrwz1fH6aR1HhFVb9zDmORfl
         42mOtuAmFLLKBkp5L4wOk5Ew50EfdmkS7rKDV87ov7+9WBi8gntxyn+wiEJfnjE9Ft
         qiMkMtSt/5+2wdzJ7Uhp0l216he+2DwwLV1l/0mPM1O3GtWWNx+LN57pB37RyrgkER
         Kib1zxcoxC/dLijXW+VLc1APLIGIpWP472Ed84bTe/7aabWbZ108K0CqNDEZW9lOwO
         04RqIUJQHyva4nRoPD4UdS85rSWdjOPwBSh4yOTbriVIJ3EB+GF5RSYSEjWqTvpIfA
         9wyjXg+Xmbehg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: Re: [PATCH] docs: arm: tcm: Fix typo in description of TCM and MMU
 usage
In-Reply-To: <YqIz2uuEEU/YYIjG@corigine.com>
References: <20220603112729.222398-1-simon.horman@corigine.com>
 <87fskd4yiq.fsf@meer.lwn.net> <YqIjgt0Df2JYlmpF@corigine.com>
 <877d5p4ui0.fsf@meer.lwn.net> <YqIz2uuEEU/YYIjG@corigine.com>
Date:   Thu, 09 Jun 2022 12:26:28 -0600
Message-ID: <8735gd4rsb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Simon Horman <simon.horman@corigine.com> writes:

> Thanks Jon,
>
> I'll post a v2 without the tag in question.

Thanks, appreciated.  Sorry to be obnoxious about it.

jon
