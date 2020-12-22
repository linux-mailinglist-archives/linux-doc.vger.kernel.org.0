Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC2C2E0F63
	for <lists+linux-doc@lfdr.de>; Tue, 22 Dec 2020 21:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgLVUcV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Dec 2020 15:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgLVUcU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Dec 2020 15:32:20 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C16C0613D6
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 12:31:40 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id b5so1969241pjk.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 12:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=K3t0gQbM6vz2TJwWgefdmZ2h7DY9X/bWdXKHVBct5Bo=;
        b=xIcXQn7R4olfb6NcIyMf0NYfvpPgw6QMgzZqfGR/vN1YUULDWUjonzB1u1/ySq/1+2
         LxpwMMHsEwVO8g1rS3R3TIZjoli5f69LDfyF5ZNNXGfOU+tHVbnyiyN+Y+zWKr1/JZL5
         S+uqgfDwY2RRWm2ZHdTC0BJLvhQzV0y417kxiPUtc2/qhs2GQA6POOqa+KU+OdEfXMoA
         A+6e3BNovWaPuA16HnA874KhkukNH+vohj9uEjGTi1uBHlJlZCvOBUoJ1T1oL8MmpH71
         t0tFwT2gvcsPX5zjaFyLTscOoRU9spDL3/Lu9+cRSLHINPBTUkaFuLh2mAlsqZtI20q4
         WB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=K3t0gQbM6vz2TJwWgefdmZ2h7DY9X/bWdXKHVBct5Bo=;
        b=f86hhHIwDSh+jxoewrpz9LkW09y2YpIGLkL6XtelZiic5tv0LlVtTfTRQxt//Ao1RB
         q75cBt8Op4+yu8l7hI0rXhyiX43+k0K/q2VUxFQquU58RSiCO/8h4pZKLiH66IzU9z6l
         sdC3JZb92rQqeU4O4Mp8CaFqtdo06FYrxDBf5hJxCcyyvAPF0zJx/rVyj9fOrdysF7OX
         8PWp/lV1omf+5m+fjDW7d402MKrMzwxU1M4creVe3mE45wE/6KWKf2A77AcWrImMYZiD
         poAqgU3HO+BGxqyJxDDuhRZaEJgXRC0gA9lw+Y8atXlDIpJY2BkRLRH02jEolZtDGNxc
         zGRQ==
X-Gm-Message-State: AOAM533ArP1dUNGxnCnTIEXRKXCLjEpMGbWtZlzYzrOni9vhHjy27PlK
        JhIEQpAwdjTVTZWwV+TEmIaB9FLo1OQCrJ9q
X-Google-Smtp-Source: ABdhPJxmDWHlPtP4ZhkG5oNkIvaR9bXeCaw5WhU7AWPPpJheCeEpfLo0O3inkKuWstj+VTyDNxvnQw==
X-Received: by 2002:a17:90a:e005:: with SMTP id u5mr23339455pjy.64.1608669100205;
        Tue, 22 Dec 2020 12:31:40 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id w27sm17486740pfq.104.2020.12.22.12.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 12:31:39 -0800 (PST)
Date:   Tue, 22 Dec 2020 12:31:39 -0800 (PST)
X-Google-Original-Date: Tue, 22 Dec 2020 12:31:37 PST (-0800)
Subject:     Re: [dm-devel] [PATCH v1 0/5] dm: dm-user: New target that proxies BIOs to userspace
In-Reply-To: <20201222133246.GA5099@infradead.org>
CC:     josef@toxicpanda.com, bvanassche@acm.org,
        Christoph Hellwig <hch@infradead.org>, snitzer@redhat.com,
        corbet@lwn.net, kernel-team@android.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
        song@kernel.org, dm-devel@redhat.com,
        linux-kselftest@vger.kernel.org, shuah@kernel.org, agk@redhat.com,
        michael.christie@oracle.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-843a42fb-63aa-4626-a60d-6e4d28a7bb73@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 22 Dec 2020 05:32:46 PST (-0800), Christoph Hellwig wrote:
> On Mon, Dec 14, 2020 at 07:00:57PM -0800, Palmer Dabbelt wrote:
>> I haven't gotten a whole lot of feedback, so I'm inclined to at least have some
>> reasonable performance numbers before bothering with a v2.
>
> FYI, my other main worry beside duplicating nbd is that device mapper
> really is a stacked interface that sits on top of other block device.
> Turning this into something else that just pipes data to userspace
> seems very strange.

Agreed.  It certainly doesn't fit the DM model.  We'd considered doing a non-DM
version of this (maybe "ubd"), but decided to stick with dm-user because we
didn't want to duplicate all the device creation stuff that DM provides.  A
simple version of that wouldn't be that hard to do, but the DM version has a
lot of features and we get that all for free.  We essentially decided to run
with DM until it gets in the way, and the only sticking point we ended up with
was that REQUEUE stuff (though not sure how that would show up with a bare
block device) and that scheduler question.

I'm going to stick with DM for now, unless it gets in the way, to avoid coming
up with a device creation scheme myself.  In the long term it's probably best
to have this be a standalone thing, but I don't want to dump a bunch of time
into putting that stuff together only to find that this isn't interesting
enough from a performance perspective to stick around.
