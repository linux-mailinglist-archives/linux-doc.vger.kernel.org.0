Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DDF56D47C
	for <lists+linux-doc@lfdr.de>; Mon, 11 Jul 2022 08:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiGKGFj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Jul 2022 02:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiGKGFi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jul 2022 02:05:38 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9475418E17
        for <linux-doc@vger.kernel.org>; Sun, 10 Jul 2022 23:05:37 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c13so3596673pla.6
        for <linux-doc@vger.kernel.org>; Sun, 10 Jul 2022 23:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KV+YGTfcaFLgrFYJ1SemBRBbLthrj0mXGJqzwOHsfoI=;
        b=So+l0JwhQ0bAC8G9LVigdRBuXXRbCLGbMLeyzAO1SPS7rHB7BzWCEvYWMPHBD3lb6y
         tfWQN1VhoiMtwVU1lL0H0f81lNwIERA8aNXNziqNi1Gcrg895q38BiB7p10le4F5AieI
         EZrDlXM61JnFyLo6V34q8mTV79QWbcE8IRiK48fJzB03o6upvNu1RwAgOTH1n2SSoc/5
         ZGLFKU3GCzzvRdluhKI4JVIoPBbruLKTeMMkZ76684hCmb9aq5+eYx4E0IlY7f6FxEda
         XUcBQW0ULEzKh4jr6EivzCuzw0upuurDhyazuTO0mglqdIzUj1dNHWvvm01yA+YoS+MO
         zBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KV+YGTfcaFLgrFYJ1SemBRBbLthrj0mXGJqzwOHsfoI=;
        b=354FO2RRAtlX2qrIXVxh7Ell/aUPGe2CMscYMHioKI+gRxFUnlPPx52PgjMFnAFOEo
         vGJOT46o9L9jH7Fh+g136ztZetnNUG1ZssnR/63kwmG87vCcRANqBNCTGs0CA7PigcAT
         IayGwN5ZdD+MxskzETcKIY2ax8883Y9jUiunIxdJtpvr9iukT6M3pCdfUgB6yIO3oJFq
         IV2Cp47txdtazUiW8AejIadsegR/DfgR4BlT9YhIpHS46GLtJt3CobMrbPTGgNzsvp6T
         p06CTDnb/cO1AeFRXevbwbzECf/KmxyxJjLBFemrnvhDKKO0h+xnncxd46ufcY76BdMr
         DYQw==
X-Gm-Message-State: AJIora8v72+SC+sqWIRtA4f5HPll25QLg+amC4sohThPKDLmhpO3xpVT
        3usCQ5ZpFGcF46rwo+u2QXvpMA==
X-Google-Smtp-Source: AGRyM1sqECluJp113NGdE2ankO4ay0QN5oroR2gvM10IiaTzw4+F0IVqlYbAV0HY9pW9BeKEW8pBpw==
X-Received: by 2002:a17:90b:3811:b0:1ef:e647:ff34 with SMTP id mq17-20020a17090b381100b001efe647ff34mr16275535pjb.171.1657519537139;
        Sun, 10 Jul 2022 23:05:37 -0700 (PDT)
Received: from localhost ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id i1-20020a170902c28100b0016c08addb4csm3762144pld.127.2022.07.10.23.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 23:05:36 -0700 (PDT)
Date:   Mon, 11 Jul 2022 14:05:32 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v3 03/21] docs: update vmemmap_dedup.rst reference
Message-ID: <Ysu9rAoRU19PB2D0@FVFYT0MHHV2J>
References: <cover.1657360984.git.mchehab@kernel.org>
 <a3a132957ac8cc6b423303f4f4491753714b89b2.1657360984.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a132957ac8cc6b423303f4f4491753714b89b2.1657360984.git.mchehab@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 09, 2022 at 11:07:16AM +0100, Mauro Carvalho Chehab wrote:
> Changeset ee65728e103b ("docs: rename Documentation/vm to Documentation/mm")
> renamed: Documentation/vm/vmemmap_dedup.rst
> to: Documentation/mm/vmemmap_dedup.rst.
> 
> Update its cross-reference accordingly.
> 
> Fixes: ee65728e103b ("docs: rename Documentation/vm to Documentation/mm")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
