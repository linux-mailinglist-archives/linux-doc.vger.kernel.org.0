Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A17A28D3EF
	for <lists+linux-doc@lfdr.de>; Tue, 13 Oct 2020 20:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731685AbgJMSon (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Oct 2020 14:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgJMSom (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 14:44:42 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902AAC0613D2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2020 11:44:42 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t21so531945eds.6
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2020 11:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ACWQZXFIYAYZvPtA0kqqET9/h2VeNuWUmvFkuiSdGDk=;
        b=DayNIijN9rJ4wynxycYBrXAQR84x3xjByl1z2VFzt7YCa69TNkAlkIdWKG0xwP6Yp3
         3F/H2nz44gihJO9JHyXWzYL4P1dc46CKqiaNR3yRo/w37eMMjkAo/koyRg9J9cet4J5o
         8pAZLke452kN1ce4bdWIlGHc47qEL6KSVsDbeqJDAMDzDUrFyC9OKIrNu9C/VaSoREWg
         9B9an2yfiyuzSelcHqdOabrCOxSG6vx+IObNMb98zyieMNME4f/11W7Es7O7m/+Kevvk
         a0bkM4fWgVplo/2Lunr6iSwR8tSVOWAyX1+gyP4UJdvdg+R8/4qIc/xXlFMWt9dzq4A3
         WVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACWQZXFIYAYZvPtA0kqqET9/h2VeNuWUmvFkuiSdGDk=;
        b=ByQwPXkSYqbLok4X6H9MtfjNNC0V/Hnt3Har9xQpNbReS637SCqltwTcLMy1EpYQMV
         61G9NceqIY3ZTRd7/21QGtrD2bB46mQ/cpUuBfFtxRpzV8yyZ2FeK9T+eIRsYtc1pFX8
         utmBrgNLpKRjvke2jRmmP7poyBh0iGL4qY6IJltlLj5EOwEuFKOYY219/5JRPM/BAxkp
         95vP5YZvWHnZkwuXOaTmdKkQDff+6sS185NZ9pViD2J8VzgvcTL1mtIYMbCBMQ0bLTxi
         MkanISyfurRU8SjqmJkYt0Iw6YALJgynSNQh3TvEP9uwGphnXZrQLK9mnVHzFpfLoDh6
         wy1Q==
X-Gm-Message-State: AOAM532IdDmUr+Omhin9a//3nsiqD8aBRxdMm8Cj4m1SzgnoTxxJPhDp
        lT6MQL5gxrSq4agW7GUe4UfyYxGaFP+tkV63//pqaA==
X-Google-Smtp-Source: ABdhPJx/D4CFI8iBKDneanR6scqyHSM4b5ae7bBsGU7JbHG59bZqw8grXz+3fxsJ2hpJPfBR1HipQc3XH+/A2xgb2Ys=
X-Received: by 2002:a50:8e1e:: with SMTP id 30mr1027503edw.354.1602614681174;
 Tue, 13 Oct 2020 11:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201009195033.3208459-1-ira.weiny@intel.com> <20201009195033.3208459-34-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-34-ira.weiny@intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 13 Oct 2020 11:44:29 -0700
Message-ID: <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new kmap_thread()
To:     "Weiny, Ira" <ira.weiny@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>, X86 ML <x86@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        KVM list <kvm@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
        Kexec Mailing List <kexec@lists.infradead.org>,
        linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-efi <linux-efi@vger.kernel.org>,
        linux-mmc@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
        target-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
        ceph-devel@vger.kernel.org,
        linux-ext4 <linux-ext4@vger.kernel.org>, linux-aio@kvack.org,
        io-uring@vger.kernel.org, linux-erofs@lists.ozlabs.org,
        linux-um@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net,
        reiserfs-devel@vger.kernel.org,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
        ecryptfs@vger.kernel.org, linux-cifs@vger.kernel.org,
        linux-btrfs <linux-btrfs@vger.kernel.org>,
        linux-afs@lists.infradead.org,
        linux-rdma <linux-rdma@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        xen-devel <xen-devel@lists.xenproject.org>,
        linux-cachefs@redhat.com, samba-technical@lists.samba.org,
        intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
>
> From: Ira Weiny <ira.weiny@intel.com>
>
> The kmap() calls in this FS are localized to a single thread.  To avoid
> the over head of global PKRS updates use the new kmap_thread() call.
>
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  fs/cramfs/inode.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 912308600d39..003c014a42ed 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>                 struct page *page = pages[i];
>
>                 if (page) {
> -                       memcpy(data, kmap(page), PAGE_SIZE);
> -                       kunmap(page);
> +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> +                       kunmap_thread(page);

Why does this need a sleepable kmap? This looks like a textbook
kmap_atomic() use case.
