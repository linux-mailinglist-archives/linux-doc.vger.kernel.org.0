Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BC45A8A33
	for <lists+linux-doc@lfdr.de>; Thu,  1 Sep 2022 03:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiIABEj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Aug 2022 21:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbiIABEi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Aug 2022 21:04:38 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01101037C1
        for <linux-doc@vger.kernel.org>; Wed, 31 Aug 2022 18:04:36 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w2so15726112pld.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Aug 2022 18:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=PI6aCTCbweBeRDa4xWdxio2HxJnrXeV8eIMex7Y3Ux8=;
        b=PBrQ6BEfP3EdKLcsxxgjvW+qPs6UlJbLGuXSIckYRL7q+tzQZkpg1d4fek9qAV/3YZ
         Nvrrqd2pxTJBjFneY3MOwSfIQXpc1x4+6JM/n1MpASl/jj7EWz/jiDpKN6ugJGF+csyN
         xf2V+9k4KC21fZ1NGNg5ESotmMF9vtZLtvqawkM9L3y3NmXuJ4fIN5etD0xabXKmLuKS
         cIhfc000MVHcDRTM97Evq7C8T5Hxo2cq1VEMe+xyndCt1jzL2f4T3wHvLfE5oncnLEIX
         1DYr4j69fjuh9vcCpXm57KZ+WRjMLIZANU890/0iLLmLxcaGVM1PtU6iASkHpIn1j1c+
         L20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=PI6aCTCbweBeRDa4xWdxio2HxJnrXeV8eIMex7Y3Ux8=;
        b=C3/JYER5aZzUTylnoUuawRKZE97n+GikZaghc1WG2hdsf1Fp7yFsQIUQscpqQROq6f
         F36ey7eE07rozgt3yfBr4bB86z1tHkULSURMzSSipDATvyETqeBHKBS4wfKV8d7MWtAS
         H8AGrYtTpvy7h4Gg5SzuQxDwFL/zyBUAuQLWUvp059VG6oRPyp9utFu5ZFn93Mk5Tp8m
         AJOxI3dJgXsfdetitA09IwiwDr7PB+dzs/RewxlbzsfRUku/uPH706M2oyCzizeahMQy
         xSUMviJ7jJwGjreqGX2o7HEWtLxCRUIWhV78K/s5nwFUaBLLqntjYJAcVgZWyxCbMMfO
         Z+hw==
X-Gm-Message-State: ACgBeo0cMApBXK+/2pkZ+uklCpJwxlmFj2CAvHQsHrMWii37osSv4/66
        JjnyNoVpWb+ah6hcMmtqoqIzfDhVVoV1cQ==
X-Google-Smtp-Source: AA6agR4PC2H9F9wUlaC8aYR5nnEI+7s5ETG31rSwikYYQQlhm9n0ihPp+JjpG3zQCZopKpRc/RAgsw==
X-Received: by 2002:a17:90b:3b49:b0:1fe:3552:ed85 with SMTP id ot9-20020a17090b3b4900b001fe3552ed85mr4451608pjb.240.1661994275980;
        Wed, 31 Aug 2022 18:04:35 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b0016ecc7d5297sm12341231plg.292.2022.08.31.18.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 18:04:35 -0700 (PDT)
Message-ID: <1a9815d4-7c99-81c0-8f9c-958fd3eef91d@kernel.dk>
Date:   Wed, 31 Aug 2022 19:04:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] Docs: ublk: add ublk document
To:     Ming Lei <ming.lei@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Richard W . M . Jones" <rjones@redhat.com>,
        ZiyangZhang <ZiyangZhang@linux.alibaba.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
References: <20220828045003.537131-1-ming.lei@redhat.com>
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220828045003.537131-1-ming.lei@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/27/22 10:50 PM, Ming Lei wrote:
> ublk document is missed when merging ublk driver, so add it now.

Ming, and you send a v2 of this so we can get it queued up for
6.0?

-- 
Jens Axboe


