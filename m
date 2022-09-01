Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A815A8AD4
	for <lists+linux-doc@lfdr.de>; Thu,  1 Sep 2022 03:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbiIABf0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Aug 2022 21:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbiIABfY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Aug 2022 21:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6874AD66
        for <linux-doc@vger.kernel.org>; Wed, 31 Aug 2022 18:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661996120;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sgRY6AVpYxwTFhEBEfeVojP2/QykwLDt049VIzQbuBQ=;
        b=FO7JueCAOUq26vS3mWTzksXFI6K5Cjn6gOvlVmplCB2IgJsz4cu22HXXdiMb+ImqPSapYq
        Qxk9fdoS/S/EpFECg0GWqj3c2s7GmtFGSrTRSC+THpYnuEOvGs/z21is0QO++0mNmJ5pWy
        vyUM1ypQPWjRlHlsekf2W6tWz9E1Dwc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-K66Me4ORN4utVuvpyb3dhA-1; Wed, 31 Aug 2022 21:35:16 -0400
X-MC-Unique: K66Me4ORN4utVuvpyb3dhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70C593C0E214;
        Thu,  1 Sep 2022 01:35:16 +0000 (UTC)
Received: from T590 (ovpn-8-28.pek2.redhat.com [10.72.8.28])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 089981415125;
        Thu,  1 Sep 2022 01:35:09 +0000 (UTC)
Date:   Thu, 1 Sep 2022 09:35:06 +0800
From:   Ming Lei <ming.lei@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Richard W . M . Jones" <rjones@redhat.com>,
        ZiyangZhang <ZiyangZhang@linux.alibaba.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Subject: Re: [PATCH] Docs: ublk: add ublk document
Message-ID: <YxAMSjrs3cuj5O3o@T590>
References: <20220828045003.537131-1-ming.lei@redhat.com>
 <1a9815d4-7c99-81c0-8f9c-958fd3eef91d@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a9815d4-7c99-81c0-8f9c-958fd3eef91d@kernel.dk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 31, 2022 at 07:04:33PM -0600, Jens Axboe wrote:
> On 8/27/22 10:50 PM, Ming Lei wrote:
> > ublk document is missed when merging ublk driver, so add it now.
> 
> Ming, and you send a v2 of this so we can get it queued up for
> 6.0?

OK, I will send v2 soon.


Thanks,
Ming

