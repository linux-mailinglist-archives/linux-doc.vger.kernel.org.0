Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C87C5F630F
	for <lists+linux-doc@lfdr.de>; Thu,  6 Oct 2022 10:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbiJFIvK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Oct 2022 04:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbiJFIvI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Oct 2022 04:51:08 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1BE95E45
        for <linux-doc@vger.kernel.org>; Thu,  6 Oct 2022 01:51:06 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f37so1682778lfv.8
        for <linux-doc@vger.kernel.org>; Thu, 06 Oct 2022 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tIvLoyAzCOVKOX99D0R9AADU51C3uknT25CXCqDgD1U=;
        b=syjvuFslfwj1fipmU574j5/yWZL2S3jYhnbWtJ5/bW8iUM/V71vSmb5AsxhaQ/2G0o
         ctXQnXj/0GSOAbOLK304yQgqsFpIlw2wn3vENsIXReAQESQ7FYQ3e3iDUnXAdUxwt4Td
         kB2rW56eQNiKHDXyNU3pU/c0Ku79mAkkC7m5TZZLTqHBqVkt65rb0q9hLTPBpEEa/mRq
         eX1zzMQ6IXkPCewSrX8mVTXOcPVRl/qAef1AVJ52kW5/Ujtn6X047jAV62EnnUX9Aztm
         0/+I6X+EdhcVKtpUJDxafJIJ2F5NBl87Wqp+wSebFHrCPcoC3fkGq5u8ifnCkUUfBbKO
         WVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tIvLoyAzCOVKOX99D0R9AADU51C3uknT25CXCqDgD1U=;
        b=6PhwsIaAPPcF9IMD+b85eCya8S0PYRhHZlvjWVynLJdUeegrkyHXGwacTuDGvrpEIW
         R9VSE75wdQlN5rU1ZFlOaiRl7GCSvs9UVKlmn7bulN0T2oR7oU6G+8QdoZb45TY2gbKc
         icYeLHIlyZwBq72Ess7cANgeTaiNKDAqC9fR/jkJb4NwCveXn6K1nS5ziudZvd7u889a
         8aMAbTKBth9etuyqleEhiAgX8q89Wnapz4lTBKqTHFPbsKf05PG6B5fcAgVUt3cKfVUJ
         77ZTMHM0BAHacjQY2AkqYgLmEl6KrkHjGLfr/C3RzaZsy1Xh08hGb2nYhhVkAqk+u9lL
         9o2g==
X-Gm-Message-State: ACrzQf1pjWseTz04myXyuU44cJRu/NQG8Y7hWi61UUKtmhR6R6MYy60Q
        uJzsEcVJ4gl/4NOkUQqXzBQCJPS5W1ivenJscJm/Vw==
X-Google-Smtp-Source: AMsMyM5ikUdU3CKf42PjcY0cjPjhnAUfk+hgFVaVlzCr5IsHwJzEJDOSLagw5jbRXrOt3sxCo/qZdi3EfGbbRlMYSzI=
X-Received: by 2002:ac2:4c8b:0:b0:4a2:2432:93ff with SMTP id
 d11-20020ac24c8b000000b004a2243293ffmr1387544lfl.26.1665046264888; Thu, 06
 Oct 2022 01:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com> <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
In-Reply-To: <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Thu, 6 Oct 2022 09:50:28 +0100
Message-ID: <CA+EHjTz=o9M47frGCXgNJ8J5_Rn=YjzZR5uvCTxStw+GfGE5kg@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To:     Chao Peng <chao.p.peng@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
        ddutile@redhat.com, dhildenb@redhat.com,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

<...>


> diff --git a/mm/memfd_inaccessible.c b/mm/memfd_inaccessible.c
> new file mode 100644
> index 000000000000..2d33cbdd9282
> --- /dev/null
> +++ b/mm/memfd_inaccessible.c

<...>

> +struct file *memfd_mkinaccessible(struct file *memfd)
> +{
> +       struct inaccessible_data *data;
> +       struct address_space *mapping;
> +       struct inode *inode;
> +       struct file *file;
> +
> +       data = kzalloc(sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return ERR_PTR(-ENOMEM);
> +
> +       data->memfd = memfd;
> +       mutex_init(&data->lock);
> +       INIT_LIST_HEAD(&data->notifiers);
> +
> +       inode = alloc_anon_inode(inaccessible_mnt->mnt_sb);
> +       if (IS_ERR(inode)) {
> +               kfree(data);
> +               return ERR_CAST(inode);
> +       }
> +
> +       inode->i_mode |= S_IFREG;
> +       inode->i_op = &inaccessible_iops;
> +       inode->i_mapping->private_data = data;
> +
> +       file = alloc_file_pseudo(inode, inaccessible_mnt,
> +                                "[memfd:inaccessible]", O_RDWR,
> +                                &inaccessible_fops);
> +       if (IS_ERR(file)) {
> +               iput(inode);
> +               kfree(data);

I think this might be missing a return at this point.

> +       }
> +
> +       file->f_flags |= O_LARGEFILE;
> +
> +       mapping = memfd->f_mapping;
> +       mapping_set_unevictable(mapping);
> +       mapping_set_gfp_mask(mapping,
> +                            mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
> +
> +       return file;
> +}

Thanks,
/fuad



> +
> +void inaccessible_register_notifier(struct file *file,
> +                                   struct inaccessible_notifier *notifier)
> +{
> +       struct inaccessible_data *data = file->f_mapping->private_data;
> +
> +       mutex_lock(&data->lock);
> +       list_add(&notifier->list, &data->notifiers);
> +       mutex_unlock(&data->lock);
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_register_notifier);
> +
> +void inaccessible_unregister_notifier(struct file *file,
> +                                     struct inaccessible_notifier *notifier)
> +{
> +       struct inaccessible_data *data = file->f_mapping->private_data;
> +
> +       mutex_lock(&data->lock);
> +       list_del(&notifier->list);
> +       mutex_unlock(&data->lock);
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_unregister_notifier);
> +
> +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> +                        int *order)
> +{
> +       struct inaccessible_data *data = file->f_mapping->private_data;
> +       struct file *memfd = data->memfd;
> +       struct page *page;
> +       int ret;
> +
> +       ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
> +       if (ret)
> +               return ret;
> +
> +       *pfn = page_to_pfn_t(page);
> +       *order = thp_order(compound_head(page));
> +       SetPageUptodate(page);
> +       unlock_page(page);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_get_pfn);
> +
> +void inaccessible_put_pfn(struct file *file, pfn_t pfn)
> +{
> +       struct page *page = pfn_t_to_page(pfn);
> +
> +       if (WARN_ON_ONCE(!page))
> +               return;
> +
> +       put_page(page);
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_put_pfn);
> --
> 2.25.1
>
