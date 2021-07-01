Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0BB3B8C76
	for <lists+linux-doc@lfdr.de>; Thu,  1 Jul 2021 04:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238678AbhGADBl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Jun 2021 23:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238625AbhGADBk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jun 2021 23:01:40 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5ED0C0617AD
        for <linux-doc@vger.kernel.org>; Wed, 30 Jun 2021 19:59:10 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e33so4813173pgm.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Jun 2021 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=HD7nLLZFahFZKeQRkjIKTsUXoINqr80+ydWGPG7amAY=;
        b=JipM+EK81ndjv8XjmzmAJdM7nmoKLbmYH/ud029YPFjEHHQVbB/Fo5LE4SsvNyIO5b
         gERHOXdwhdz+t4OYKRRGVblLlhzuS2lo8OTBXlqDDB0W3KY1OYKqL2l7xHrFG7ZJZqT1
         2JILMRYYp/3JlubEa9F1YPhupMcEzRTqegorrJ69vvLNZa1nUc73hpMvkdtg6ExOKhMB
         6TW+ug59UI0zGXJIMD+Uwx+OaiPvQJfixASfK6Z6NwsPqS94k0+oxoyeypiZqaB8HbTY
         8u7xBcQnv1L1RfxoZlY5EqoU8jbUVaZcMnqRE676a6M3yTjeHnp4nf5/Y0qYTqURgZLH
         Yzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=HD7nLLZFahFZKeQRkjIKTsUXoINqr80+ydWGPG7amAY=;
        b=r3MNzFLhYSGvkuMcQdHdm9ppZd3zgF9x7bkM9BFMeFmpj6h3zYoCRieW8gclmlfinA
         MmrQ8P4L5YE7d3ae4yvr0qeQZhC4bBFRw0UpNP+DctX2Gg+43lrzIq6UM0ADoo14Qwy/
         JqQvvWFIlQ/liG2X9ZCtUNUazEdAWLVfxdpNlD1JS0FDhyltQ8rDVUfSz6Nh42pNU+Cw
         VK5Afp8bTHe502KHK5WJrPnPPU7WiG6+Bg7Q1a5w0RvoCzu2ElLolNfuuKlFQzgwryic
         fiwrd/YkVAwinL3mZXD7qzIe2OtLwkULKrVmq2F0KZcxzgggvKy7fZ22nZ8jGs+y3cpl
         Lclw==
X-Gm-Message-State: AOAM531Y9C9FyTFZIDRXHB0qkLx1x/p2ItNK+GO9AHQgiNi0OsQbdUUh
        eyydAXIk2sszpBUs/Pq7pCxlOQ==
X-Google-Smtp-Source: ABdhPJz2BHWOJV3UUYXKeWeaBZ/AB8h/54zHJj9UpIKDhfF3sYh79IHmRjAQOd7jI6yIM/InDUUhmw==
X-Received: by 2002:a63:4c5e:: with SMTP id m30mr37239105pgl.153.1625108350026;
        Wed, 30 Jun 2021 19:59:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id k8sm14831808pfa.142.2021.06.30.19.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 19:59:09 -0700 (PDT)
Date:   Wed, 30 Jun 2021 19:59:09 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jun 2021 19:58:58 PDT (-0700)
Subject:     Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear mapping
In-Reply-To: <87czskonsn.fsf@igel.home>
CC:     linux@roeck-us.net, alex@ghiti.fr, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
        aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     schwab@linux-m68k.org
Message-ID: <mhng-99340121-50f8-49ca-ae6e-0f737fc4d736@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Jun 2021 02:14:48 PDT (-0700), schwab@linux-m68k.org wrote:
> On Jun 16 2021, Palmer Dabbelt wrote:
>
>> This seems a long way off from defconfig.  It's entirly possible I'm
>> missing something, but at least CONFIG_SOC_VIRT is jumping out as
>> something that's disabled in the SUSE config but enabled upstream.
>
> None of the SOC configs are really needed, they are just convenience.
> They can even be harmful, if they force a config to y if m is actually
> wanted.  Which is what happens with SOC_VIRT, which forces
> RTC_DRV_GOLDFISH to y.

Ya, in retrospect the SOC configs were really just a bad idea.  I think 
we've talked about removing them before as they break stuff, I just 
haven't gotten around to doing it.
