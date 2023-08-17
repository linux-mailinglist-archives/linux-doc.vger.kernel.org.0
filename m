Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF9177FF90
	for <lists+linux-doc@lfdr.de>; Thu, 17 Aug 2023 23:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240744AbjHQVNC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Aug 2023 17:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355179AbjHQVMv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 17:12:51 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D68E358D
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=glwxiyY3JVvFXvo819xeK51kDmUhsEf3xXAHttoHVPM=; b=oiQY2Mmkq2Ko0K7o2uRL7Fnmpr
        El7WGZIWiWCwZ4fbiZyZIFv9lCruKWQobDIDCtqkGdMnTBneKHU40TFJPvpTABEODkBydV8a5BCX7
        pLfLIjNa/6+TiReqirQE8/Bf1dfw+j1mRf2P064cOfQIlo9Y+HYQ8eY1kNpPNBXGLUUwXydCQE4AV
        oCpy/wI1Rlb8AbOMw7bXXDopGUr/4gaU5CkKVM2+tYeFvhYIeRtrRtFd2C3sA8DQw1s0M5l9IbHwT
        Erh4sm2j+c3THGoOjLPQKJ7O5jgdboO/zxwV3r+4W6H1P9SPZZ45G/aBKe8QNcKFVjJ37EfdgcDsy
        xAxQ1qFA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qWkIS-005VEv-Sz; Thu, 17 Aug 2023 21:12:49 +0000
Date:   Thu, 17 Aug 2023 22:12:48 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     mail@renenyffenegger.ch
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] DOCUMENTATION: Correct filename in Documentation
Message-ID: <ZN6NUPTCYaRPmSCZ@casper.infradead.org>
References: <20230817205940.7477-1-mail@renenyffenegger.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817205940.7477-1-mail@renenyffenegger.ch>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 17, 2023 at 10:59:40PM +0200, mail@renenyffenegger.ch wrote:
> Correct filename of renamed file in Documentation
> 
> The current documentation in Documentation/core-api/kobject.rst refers to a
> macro named `container_of`, supposedly defined in linux/kernel.h while in
> reality it is defined in linux/container_of.h

Maybe we should just remove the reference to where it's defined?

