Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0A44F54C4
	for <lists+linux-doc@lfdr.de>; Wed,  6 Apr 2022 07:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiDFFJp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Apr 2022 01:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575991AbiDEXJs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Apr 2022 19:09:48 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8705935870
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 14:40:34 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id s2so678351pfh.6
        for <linux-doc@vger.kernel.org>; Tue, 05 Apr 2022 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=+VkEMKPsUn5codAwC2objI7iKq9LeQy/6DGModLXRws=;
        b=a8L5o5P9uTOesLLONs4iibuBLPNtqXkJvnT5lW7YCQHxQj+KHSe3RjpJncrX2lwxya
         m0fpQalAUhuzaUI4Tcwrw1xxjobzM5WSzUovJuKD63HaCOAusMNombgK9/8bW0kMD9RA
         uXW3PuCngloNczariQrjxBBTI4pEg/lF5UhdpHu4gZf2rRUUsPk5RzgzY2vdluwR9223
         pvjyjRYpy+K2FvL0jB38jXUwaPr6w56Vx3V/I/KUvL1Eg21tAnG7cNwW8ZB8IVEFLgFp
         9d8bP7jb0a04ePZkHF8/bcPfS16jTZpInlewoW8Mby/pG/YZ/tNxtGBvPi8vwpW/VET7
         WQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=+VkEMKPsUn5codAwC2objI7iKq9LeQy/6DGModLXRws=;
        b=x8FEY/yytyjNIZ5hOpBSrd/7nv7Vp0P3ZdUTUlTzjnDtZwDpBOpECX4VXMJhyJXXo/
         AeZnQHvH2z8GL9D2reyIU26ULDMrkizGzU0fZOCXtTMLaom6JMCWR+vQoxMIfpQu22u4
         iDEyLbSBr/qPVlN92atbCLqMwnokfDKAsDwGuFwD0GEs+2C+EitWFeMTzYW0/DC485sq
         ZKg6dYRYsXLNHkmSOev6lxR6ngSAV9o6JnpO8drbm6Uwg+cGlNxouwXIBqwJh0d3nOaJ
         1HQ5curso8+zjtxbOsVamaTupeWSBKU1vKa7fqNnEyeX6MbsmdlvwEGDu+djx3Qha0Ql
         5Big==
X-Gm-Message-State: AOAM531YhaFWXlXVeFYElf5pZj/u2DsD1O1gXEeX6IezQr/TjARUm8LR
        OTjKVWnX/Arzke97GMNK3WtgKA==
X-Google-Smtp-Source: ABdhPJzohfbOUrOhh/eLDwWhPKl7DNSBnOmqX6sET9SS3mk7vVXphuAZWMw56KG1ZqqSbTanxtD0Bg==
X-Received: by 2002:a05:6a00:1341:b0:4fa:a3af:6ba3 with SMTP id k1-20020a056a00134100b004faa3af6ba3mr5505300pfu.51.1649194826458;
        Tue, 05 Apr 2022 14:40:26 -0700 (PDT)
Received: from [2620:15c:29:204:be3e:5e1c:99cc:513f] ([2620:15c:29:204:be3e:5e1c:99cc:513f])
        by smtp.gmail.com with ESMTPSA id o30-20020a63921e000000b00398e665e830sm13002381pgd.48.2022.04.05.14.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 14:40:26 -0700 (PDT)
Date:   Tue, 5 Apr 2022 14:40:25 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Vlastimil Babka <vbabka@suse.cz>
cc:     Christoph Lameter <cl@linux.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Pekka Enberg <penberg@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        patches@lists.linux.dev, linux-kernel@vger.kernel.org,
        Oliver Glitta <glittao@gmail.com>,
        Marco Elver <elver@google.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Imran Khan <imran.f.khan@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 6/6] slab, documentation: add description of debugfs
 files for SLUB caches
In-Reply-To: <20220404164112.18372-7-vbabka@suse.cz>
Message-ID: <fcf0fbc-b464-cab-e8d7-ae1322b2ffb3@google.com>
References: <20220404164112.18372-1-vbabka@suse.cz> <20220404164112.18372-7-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 4 Apr 2022, Vlastimil Babka wrote:

> From: Oliver Glitta <glittao@gmail.com>
> 
> Add description of debugfs files alloc_traces and free_traces
> to SLUB cache documentation.
> 
> [ vbabka@suse.cz: some rewording ]
> 
> Signed-off-by: Oliver Glitta <glittao@gmail.com>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-doc@vger.kernel.org
> Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: David Rientjes <rientjes@google.com>
