Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082737BBAE7
	for <lists+linux-doc@lfdr.de>; Fri,  6 Oct 2023 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbjJFOzj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Oct 2023 10:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJFOzi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 10:55:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB168F
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 07:55:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E078AC433C8;
        Fri,  6 Oct 2023 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696604137;
        bh=escjTaAkihSGCwsnxPhJNWcVLi3MOtJXB2WfVZLU/AI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Xjq91hMUaSUj8yHtoYoNfxZsXwJMtqvlTupffCdR2YqZrTI02mHmFywx6WT36rqAR
         XrYQ8/ALEPGkvO0a61fV+WztHkKKKl+zgJrQxl7eIWRNgTE5c7XvFB/QQXK5jt0QYM
         nf075SJZMFtTd4ckmPb9JIU+0EifqUWsTni/VUCtI2wT5a0NEGIPm993UgSnbD+Dzg
         z9lfKhDs5GWxmz0AbJjzYDxDaMdW4ERn/eeRZPcH3Qr2QwXlBwAXN4otiY4K4TJ/DK
         uEDxEvs+/GxE+LHO3vPhhAiTXbqmENV3cFz4on9f3Ry1BnyTQ7EcskuZQr5UUDa0c5
         1XFU4+/wjFSAg==
Date:   Fri, 6 Oct 2023 07:55:36 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, linux-doc@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v3 2/5] dpll: spec: add support for pin-dpll
 signal phase offset/adjust
Message-ID: <20231006075536.3b21582e@kernel.org>
In-Reply-To: <ZR/9yCVakCrDbBww@nanopsycho>
References: <20231006114101.1608796-1-arkadiusz.kubalewski@intel.com>
        <20231006114101.1608796-3-arkadiusz.kubalewski@intel.com>
        <ZR/9yCVakCrDbBww@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 6 Oct 2023 14:30:00 +0200 Jiri Pirko wrote:
> >+version: 2  
> 
> I'm confused. Didn't you say you'll remove this? If not, my question
> from v1 still stands.

Perhaps we should dis-allow setting version in non-genetlink-legacy
specs? I thought it may be a useful thing to someone, at some point,
but so far the scoreboard is: legit uses: 0, confused uses: 1 :S

Thoughts?
