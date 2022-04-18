Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87F2504A26
	for <lists+linux-doc@lfdr.de>; Mon, 18 Apr 2022 02:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbiDRAJh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 17 Apr 2022 20:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbiDRAJg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Apr 2022 20:09:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E09E12AC9
        for <linux-doc@vger.kernel.org>; Sun, 17 Apr 2022 17:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=Qfh3Z0W9Ruqb8r8jCt+wWN/pY9IUOItcKeEEjZ6eHqw=; b=mVxgUv+i1AaG18NKzxBa7fljm/
        N/y/qBKEnQs3JSFWbQllFeueVGtoSJjihgLzYzJhNj+aVozJn3ud1goL2wkP5ZvItQ4pOFoMhJSg0
        BnE2ePdFpQLtfUwf4cF0vatZM6z6GF4vckIYu4YH+TPsMg19Rx19dLBNxjwE3ifhXU4eDxBWiIkWS
        1+pPAy95gQ6NtSgTawJz3kMeh20X57XIbvM6BSSYvXuofK5p5d9y2vRLKLqnL4lCSZa+THk/tpGbv
        sJQZbCadJYIiGbsanFG1oRHYbHUHdsLA3nGyO1DYYP8mdvzRhQg6h9tQY+t+NMilsxzAD9Mpe443Q
        t3yQEKag==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ngEuq-001flb-LJ; Mon, 18 Apr 2022 00:06:53 +0000
Message-ID: <16ed554f-0f25-e914-5cb9-dce53d027f1e@infradead.org>
Date:   Sun, 17 Apr 2022 17:06:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: docs: IDE removal?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Would someone suggest how much of
Documentation/ide/ can be removed, given:

commit b7fb14d3ac63
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Jun 16 15:46:58 2021 +0200

    ide: remove the legacy ide driver



ChangeLog.ide-cd.1994-2004
ChangeLog.ide-floppy.1996-2002
ChangeLog.ide-tape.1995-2002
changelogs.rst
ide.rst
ide-tape.rst
index.rst


thanks.
-- 
~Randy
