Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E426C56886D
	for <lists+linux-doc@lfdr.de>; Wed,  6 Jul 2022 14:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbiGFMen (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 08:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbiGFMem (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 08:34:42 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1170917053
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 05:34:41 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j1-20020a17090aeb0100b001ef777a7befso6804389pjz.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=hW2431492sCVZamN/p5cUoH7v2KxbwYiYFtMhbuxSSs=;
        b=aO/ZC+U5LATGWzsMenvtODpWhcejLQ4DmRLha/4SFn11Wf8DcIrFk1B5B3fP0AvXUg
         F1PUOqzt04jGHL+kW42wdhfxoatgfieaCaFTjTsg/0aPS0d1NSqzbVAWUr48FwKbi2kk
         bNQBektjLeeE1K2U1dLcbw68C5O909m3ltoYOt5psp5Gsf6ooUgQxbp7vtkJxaFCNVLq
         JB5JDSboVX7gNuCr6BqOEB2T1vnXsuL9FxkeVt6f0+RSoxgWygebchQshMWMnbZdv7Xg
         QtsTjaAJP4QGjnj40SClqvGtAh7oHGQx9EV2mY92w7wDa5vthlOb4om9GVvEhy9g8Ujc
         ZNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=hW2431492sCVZamN/p5cUoH7v2KxbwYiYFtMhbuxSSs=;
        b=5yoo+MfzwXM0f1VwblH/Ku97J6yBpD+xtmypZwvBqlUss7MXTeVAKY5cEVrnsAlClw
         0CprPSNxvWbKYbxIDMCU5pL5DfKVWVAgI/nr6nm4dKsueXywOTov5jqGtJsDt61ir8Wd
         GNKkg9+LjrQZsmXTXvDgW1PBxtgYBjKZ9/vWU5nJmHxwlwgJkY/ydcRmAwPTv2Hk534f
         0nwBsCFWXTzEVKXc2w2ocf5boG8U9aE5MQN0Rl5QWtfI+1jnd0dxPGAETDUA8/AjjceV
         vLmqjApM0zDbTrlkLk4ALGnR1zELeL5HstP/f8b/8y4H3xny/cLTkGva2896c8wDViLs
         UoWg==
X-Gm-Message-State: AJIora9dOXhHhm5W4Xt8YqUuhJxrEx4fEz3evSHHtJ/EXnkEhuCeV1ET
        L6JViFG0T6keCacsBEqOg9r3sA==
X-Google-Smtp-Source: AGRyM1szJSqnPFX6luEMhyzzQ0Aeywhddc3vVY3+ZKqUe4ppobSQfJg1kQYfqyNYWH89tB/Ll0NihQ==
X-Received: by 2002:a17:902:ab42:b0:16c:66d:c44d with SMTP id ij2-20020a170902ab4200b0016c066dc44dmr1314197plb.125.1657110880402;
        Wed, 06 Jul 2022 05:34:40 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 84-20020a621957000000b005289cade5b0sm2634560pfz.124.2022.07.06.05.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 05:34:39 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     jejb@linux.ibm.com, hare@suse.de, kartilak@cisco.com,
        Christoph Hellwig <hch@lst.de>, martin.petersen@oracle.com,
        satishkh@cisco.com, sebaddel@cisco.com,
        damien.lemoal@opensource.wdc.com, john.garry@huawei.com,
        bvanassche@acm.org
Cc:     linux-nvme@lists.infradead.org, nbd@other.debian.org,
        linux-scsi@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-block@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
        linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1657109034-206040-1-git-send-email-john.garry@huawei.com>
References: <1657109034-206040-1-git-send-email-john.garry@huawei.com>
Subject: Re: [PATCH v3 0/6] blk-mq: Add a flag for reserved requests series
Message-Id: <165711087866.291548.18135186803736478100.b4-ty@kernel.dk>
Date:   Wed, 06 Jul 2022 06:34:38 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 6 Jul 2022 20:03:48 +0800, John Garry wrote:
> Can you please consider this series? Thanks
> 

Applied, thanks!

[1/6] scsi: core: Remove reserved request time-out handling
      commit: deef1be18e3fc62ddf04fb3e5e8ff6a301693dcc
[2/6] blk-mq: Add a flag for reserved requests
      commit: 99e48cd6855e9535488e3c90d65edd46c6e6fc1b
[3/6] blk-mq: Drop blk_mq_ops.timeout 'reserved' arg
      commit: 9bdb4833dd399cbff82cc20893f52bdec66a9eca
[4/6] scsi: fnic: Drop reserved request handling
      commit: 1263c1929fb8c375494666ec6d1bac838ff02c25
[5/6] blk-mq: Drop 'reserved' arg of busy_tag_iter_fn
      commit: 2dd6532e9591f201e7571b30915db807603ab924
[6/6] blk-mq: Drop local variable for reserved tag
      commit: 4cf6e6c0106bf6e6d034fa6043b4428ac2f267fc

Best regards,
-- 
Jens Axboe


