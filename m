Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B0064E7AD
	for <lists+linux-doc@lfdr.de>; Fri, 16 Dec 2022 08:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiLPHY3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Dec 2022 02:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLPHY3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Dec 2022 02:24:29 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE98396E2;
        Thu, 15 Dec 2022 23:24:28 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 305E668AA6; Fri, 16 Dec 2022 08:24:24 +0100 (CET)
Date:   Fri, 16 Dec 2022 08:24:24 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
        axboe@meta.com, sagi@grimberg.me, kbusch@kernel.org,
        linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] docs, nvme: add a feature and quirk policy document
Message-ID: <20221216072423.GA25337@lst.de>
References: <20221215125130.261098-1-hch@lst.de> <fac7f8be-58da-f588-f6e4-4cf64529d55d@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac7f8be-58da-f588-f6e4-4cf64529d55d@infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Randy,

your nits look good to improve the language in the document.
