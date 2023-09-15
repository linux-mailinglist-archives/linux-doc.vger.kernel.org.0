Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2AA7A28D9
	for <lists+linux-doc@lfdr.de>; Fri, 15 Sep 2023 23:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbjIOVAo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Sep 2023 17:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237794AbjIOVAb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 17:00:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65DB1BDC
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 13:59:23 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-69042d398b1so1205609b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694811563; x=1695416363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6IMANHRE1s3S84jS+w6+Qoqw0M0rcfmVcD5hXKsC/0=;
        b=Bru55z23L8YpHrQPY3cxE4rWliYHnr+AaexITUWq0YaRjIi8+y2jVIklOZhO55SYY/
         Tpe1Jdd0sMMAPGpDUPNZcJQ9dlLvDWg8dZ/3QBGvQgUVSY2Tm5/Ji5abFsExOO6l+UDW
         bE6VGXE/5zMjvRHX41BaZuTfhL+Z5nker5WKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694811563; x=1695416363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6IMANHRE1s3S84jS+w6+Qoqw0M0rcfmVcD5hXKsC/0=;
        b=SnxDYnN+P1UIhoLkxF0GvVHnTufEJFmhbROJu178W6sLgHU2QufUZ6b44ACncOSGip
         x8uCt6kwkgxnp7dRhmG/lcfMe0kGz1QmjKZ9ApslTCZAkdawlnURvHmsyxiUSUVo2k7s
         O+IHZixUc1qjS33Vlt3AP7V6bGXfnXuQ9ny5fp3bgo/S1LIiGQl2RCN45usiRrXDdf7L
         UsynEpuw3rTFQCNsictia6S3t2t4vyquD7ccLKN6n86ys7P0ru0vFMDCDJF7zMvpz47W
         LFT49agNyggEno3uNpTnkiRwIvJNkKWo6XUrwiK9ItvGU26qyk4MkDHmVwm7Wg8j6Wrm
         IOMg==
X-Gm-Message-State: AOJu0YwCto4gVvkUjBWhkECbEp4do7wsXx3iYo9awJ3td4d0HUncPhGU
        H7TcffnWQh6FAHQOG2nooGjPug==
X-Google-Smtp-Source: AGHT+IHICtkn1k/bvESPz6mabCEaw/ubBh4oc+BOb5/F+seBtrLScy2ak3pvnCAh1xlfujELjdpd/g==
X-Received: by 2002:a05:6a00:2d90:b0:68f:c7c5:a73a with SMTP id fb16-20020a056a002d9000b0068fc7c5a73amr3300057pfb.16.1694811563451;
        Fri, 15 Sep 2023 13:59:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k25-20020aa792d9000000b0068c0fcb40d3sm3306512pfa.211.2023.09.15.13.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:59:22 -0700 (PDT)
Date:   Fri, 15 Sep 2023 13:59:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     cl@linux.com, penberg@kernel.org, rientjes@google.com,
        iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, luto@kernel.org, peterz@infradead.org,
        jannh@google.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com
Subject: Re: [RFC PATCH 04/14] mm: use virt_to_slab instead of folio_slab
Message-ID: <202309151359.D608396BF@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-5-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-5-matteorizzo@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:23AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> This is refactoring in preparation for the introduction of SLAB_VIRTUAL
> which does not implement folio_slab.
> 
> With SLAB_VIRTUAL there is no longer a 1:1 correspondence between slabs
> and pages of physical memory used by the slab allocator. There is no way
> to look up the slab which corresponds to a specific page of physical
> memory without iterating over all slabs or over the page tables. Instead
> of doing that, we can look up the slab starting from its virtual address
> which can still be performed cheaply with both SLAB_VIRTUAL enabled and
> disabled.
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Refactoring continues to track.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
