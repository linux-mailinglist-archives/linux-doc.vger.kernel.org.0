Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97EE6A6FFC
	for <lists+linux-doc@lfdr.de>; Wed,  1 Mar 2023 16:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjCAPlm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Mar 2023 10:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjCAPlj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Mar 2023 10:41:39 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67574457E6
        for <linux-doc@vger.kernel.org>; Wed,  1 Mar 2023 07:41:36 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id l1so13765415pjt.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Mar 2023 07:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=RacUjtkKVhkSdFUBywOGho+8dt8NsK+GHdxWXdQ69WX2yCf/yYWl7r6icMXBWT/ShM
         KzbzJEeKqlnWntlEh4Hu5sno9Ak81pDzhFum2pY94j4Sv2hldxTUvXOesOtDXjR8r6gc
         qTgIZDS9fRsSDLNbTTTqAFsgPsTJ/DQ+0jjGE9ek1g+5UBhUcmjFAxCNoVki1FxJorhz
         1mqoDsTuoBLwUNz+cTKmWUvmBN0WlvjuL/8NCCPe/UsZ69pgJ+6lNteW1mdicJGes/KY
         sz2TvcyHAjAaMaJRH5/VJiCFama3PVa+Xs98E38Ow6CsZfQ4ni3p2/e/LUrMvV5jGCLw
         yEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=v9zT0FZ4fpDrV2yq0DzZd9DAe3Bw1/JCUpmJ84vlPqteRaorq5ETNb8VTNnOeTLXrp
         ha2uK1mPmuMEKzLuhqsrVq7vAAJsaZV7qjNpgasfF8cGohcqJd/louM45YTdbi86LOZN
         5eHSdwY9/WQE33kESUGHgyaEn+xiqwJSbYnvGSWkbkEe4tPDM+cHnkbDDVXRUYZuOuf3
         q+hUce/n4metCewX00kqFLmifGEOOixdnis9sTFsAO9EXjJ3Gb7+RTYDbmTgq0FPOzUX
         qSNjpthODGC/YuLm4b4anDVgTjKjg7FwbXFENW5x7STesk5OSoDh3avHZpbByja0SG3T
         HB1g==
X-Gm-Message-State: AO0yUKWGq6zATD7x4WSc6qAhJURWcq3UDS2VHIP6OwNG8F+TAyCvQxCS
        rBFmwwZvNIzKoZvEBwGceLdRCQ==
X-Google-Smtp-Source: AK7set89u8u7K351sr+Ck6r7PKKsfq0NxjZus48TDBYC9SmTqwP5jGqb0tSf18Db2RC/D0Tp3KOSQg==
X-Received: by 2002:a05:6a20:2444:b0:cc:ac05:88f7 with SMTP id t4-20020a056a20244400b000ccac0588f7mr8304959pzc.34.1677685295782;
        Wed, 01 Mar 2023 07:41:35 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id l12-20020a62be0c000000b005821c109cebsm8058970pff.199.2023.03.01.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:41:35 -0800 (PST)
Date:   Wed, 1 Mar 2023 07:41:30 -0800
From:   Deepak Gupta <debug@rivosinc.com>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
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
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        david@redhat.com, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
Message-ID: <20230301154130.GB3505369@debug.ba.rivosinc.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-14-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 18, 2023 at 01:14:05PM -0800, Rick Edgecombe wrote:
>The x86 Control-flow Enforcement Technology (CET) feature includes a new
>type of memory called shadow stack. This shadow stack memory has some
>unusual properties, which requires some core mm changes to function
>properly.
>
>One of these unusual properties is that shadow stack memory is writable,
>but only in limited ways. These limits are applied via a specific PTE
>bit combination. Nevertheless, the memory is writable, and core mm code
>will need to apply the writable permissions in the typical paths that
>call pte_mkwrite().
>
>In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
>that they are special shadow stack flavor of writable memory. So make
>pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
>create regular writable memory or shadow stack memory.
>
>Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
>
>No functional change.
>
>Cc: linux-doc@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-alpha@vger.kernel.org
>Cc: linux-snps-arc@lists.infradead.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: linux-csky@vger.kernel.org
>Cc: linux-hexagon@vger.kernel.org
>Cc: linux-ia64@vger.kernel.org
>Cc: loongarch@lists.linux.dev
>Cc: linux-m68k@lists.linux-m68k.org
>Cc: Michal Simek <monstr@monstr.eu>
>Cc: Dinh Nguyen <dinguyen@kernel.org>
>Cc: linux-mips@vger.kernel.org
>Cc: openrisc@lists.librecores.org
>Cc: linux-parisc@vger.kernel.org
>Cc: linuxppc-dev@lists.ozlabs.org
>Cc: linux-riscv@lists.infradead.org
>Cc: linux-s390@vger.kernel.org
>Cc: linux-sh@vger.kernel.org
>Cc: sparclinux@vger.kernel.org
>Cc: linux-um@lists.infradead.org
>Cc: xen-devel@lists.xenproject.org
>Cc: linux-arch@vger.kernel.org
>Cc: linux-mm@kvack.org
>Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>

Acked-by: Deepak Gupta <debug@rivosinc.com>
