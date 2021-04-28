Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC8536E04D
	for <lists+linux-doc@lfdr.de>; Wed, 28 Apr 2021 22:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240946AbhD1UcQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Apr 2021 16:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240601AbhD1UcQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:32:16 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EC6C06138C
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:31:30 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id a11so2629099plh.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X8hdJrj+BWcDqZ4bW4h2pNAqs92BmI2AsU4ld/EBkiw=;
        b=iI0jec9SDqWTC7iVkmmleZKmFxnoAhgXjmhD3GBMXI6hAcgWgxdE8rk8pw1d8gwKEe
         jiiEowLOMDPAOnn341yCsTffY8AeQm4SMl8U1OQbFW8sXyyX3ojyqLLXxDHGhi6FZYZi
         kwPvnwSRg8ZIzYwNIHaDMsdRmYUm/aznEAU5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X8hdJrj+BWcDqZ4bW4h2pNAqs92BmI2AsU4ld/EBkiw=;
        b=q+fP0bL9jgvG3G3QjI6VVJif8/4T7xyDYR7BTJ75ZUarUGB3VQ1EcS1kX/cws8hN8H
         00u3fKkVHvxBdigX806Lpvx7IKTsnIQ1UFYGYT3RHdwwvJJFOkpUDbjANKGT2zgE9c+q
         LsJnUcO3OuybHWTXK0cmsDI+PYUiIn0O0ZUJEK1gMUm3RggGKdzlo8aOT3ooNqNP4wrS
         hBQI2I/rTExoKayQ74/S2qS2kLJ0DJAUpRLy5NaIKbTwJFEqS8i3LWfXNWmYEtUX4D6L
         CF6a9tOOsqvMSu4aux1L0Lcu2tPED+7sD5I6FbY3lBc1PkGSNppWg0QtXFv90Efi6TFt
         ZEYA==
X-Gm-Message-State: AOAM531JUEhHexb+ZavkDG/xSHGlZ1ZKUIq/Yio0QvFRz3PsTpsIV6il
        XAGLEYLE7Pp2iVOZdhwejgpDDQ==
X-Google-Smtp-Source: ABdhPJzu07p9Ep6FFlV4ekxK1JTBTpTjmwV6obAgpk10d2D/VzX4t6Ftslv5gywEH3Rs23w7Ak1szA==
X-Received: by 2002:a17:903:185:b029:ec:b44d:7c3e with SMTP id z5-20020a1709030185b02900ecb44d7c3emr31893977plg.44.1619641889956;
        Wed, 28 Apr 2021 13:31:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b4sm448450pfv.188.2021.04.28.13.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:31:29 -0700 (PDT)
Date:   Wed, 28 Apr 2021 13:31:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Subject: Re: [PATCH v26 4/9] x86/cet/ibt: Update ELF header parsing for
 Indirect Branch Tracking
Message-ID: <202104281331.1CCFEFCF1A@keescook>
References: <20210427204720.25007-1-yu-cheng.yu@intel.com>
 <20210427204720.25007-5-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204720.25007-5-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:47:15PM -0700, Yu-cheng Yu wrote:
> An ELF file's .note.gnu.property indicates features the file supports.
> The property is parsed at loading time and passed to arch_setup_elf_
> property().  Update it for Indirect Branch Tracking.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
