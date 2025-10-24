Return-Path: <linux-doc+bounces-64406-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDAC03EB5
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 02:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34C591895D8F
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 00:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08288450FE;
	Fri, 24 Oct 2025 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGTInx+a"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB371DFDE
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 00:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264091; cv=none; b=XtwoixxxYat3dufcb/r9LA2dGdQPDSu5BVodN+7lBUjvKy9SuwfGj6J3iiKxdSZuENvUrUHYEMUi+1t339BAFqTDEF9E/J+MKDsupDe5I1SyeZ64XuSavE/EOo554ymaKx6pvpl3qo0JqMyEjyV329gX9wRWv/6ymTpbdWxC7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264091; c=relaxed/simple;
	bh=bubCr/mN0mnspeP8HsbjxerBcLX67vjT45heWM5Tngg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/MzocFZWtdhmg8fNVeW6bmZSPyYS86H/nWlSScsmvI7lUJl2JM1GU8Xzt23mY8uWCYZLJ+iBoQWKvmqgouuSOh8YPaTVPXFyVQX04apAyA+6c5/6h0SX8ld/8i6pfzBLe1EZlmEwyLr3YNq+wufIlhzdAzgaRYeOU6rTLKwYKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGTInx+a; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4e2d2d764a3so11161761cf.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 17:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761264088; x=1761868888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SS55Wat3aHjR4MMWG/CBZ2nFmq+zfQc/VuJXnUoVzR4=;
        b=ZGTInx+aztBuwQ2IgRwQPjv5DNbqo+XqzAv/08b60hjrxyzcp4EAVp6so3JuOEJqmm
         teHQ6zMbNavhimGqFEwhZwr430UC7dkHEc2HM0WvXrJQSv2qTezUKD0CSBUl94cltZL7
         wmvPjVWrCBUYhrh7gALdJWKbQN4dsHyq/otzT0HT+tALt0qnUIamCZWvC8Gw0UhDpC91
         Y2HSTtvN08YgH72ymR0Ml5O3NTr0fQB4u1kiNT80utGJIahWdBC3su1givJVvqb6ZYCa
         DXsKP8C1dbZOZdQglHvjd7w+oomHfbaJiQ5U3hWx7NgjcYAv2gKEg7LlM9/4BqqzdUb1
         4hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264088; x=1761868888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS55Wat3aHjR4MMWG/CBZ2nFmq+zfQc/VuJXnUoVzR4=;
        b=R7z3ZlBrxTvwSMwK0W6Bb9nDpIEAKmWUupfKCgBfuDw4pnf3siCqDlxOV5dGEWDBvD
         YsBTL3CAVXPni+NLhhu4biAaPuJU/qV4SiwzSKCfrY4pPukdRp4dI9lDN+oCVGre8ZnK
         fBAkQSubIG6/BG5ushysTosAnQaB9JtozZf8k0B19rjGNhlEzYl4mHWVTsjk5kPHe8L6
         o6N1NJoIg5Zuy/mWKUtslhHjxiOWxKpSrzRWL8rzuzSGajJfY//1pPlKuyV/iOPPqLT0
         HYK9I2VNyyeTgYVQ3il20UcXkOfnVZ5mkrNfXvF5s3fZHk/Lz+Q11sK4a73sYfJ9hvsL
         232Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmrMKMAa0e1IuOHL8FTkpdrorC2koIOj5QH5nU7F6eD+6Sy4ntTfy+0r3NLigKLRlBQcAmBUuj1lM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/m810KW/gv8jHHFaIEU7M6U+E0V4LwuM74W+ArfZoyDQE/AT
	ji8KlzvQGQoqxx3nDJGlPICsLZyy91Vw+URdn0r2f3TqY8ojq+U3wg+Beme/K27lnUX3eRXXItA
	UrvjBtfErFR2RmVXOH/t/asv8RWI21rE=
X-Gm-Gg: ASbGncu0PVMZYiZpLnlKlJ1Ipvsvc+O8V9aOElkYr9YlSLvm0hHFa/26UT40i6rIWeI
	gEnRRxmxQL8CclIbYQ6HfwGoKqfEqyPfBUT25p3SgNWqdfwzOmhMNM3Xa0iYO7zjS5fWqSliZDW
	/C35qoBi0lMCKDQyARsaMNiXkEIZjFuK46Mp5OBcwxrhhzp2tazSP9uNdWDDklIR1NKRP6GIghS
	A5PpNAdNQ7jD5i8ttGl9FRcDmxQAXzPQhykT6U7obZF3Nfittm+GT6e1UG6EoamIvQ01wG9/rOF
	XxKmrI6Tr61bbc4=
X-Google-Smtp-Source: AGHT+IE4hgSCHnM9w+Nj49Niog7hNVTuiW8jTj0btmv/nz9MG2xgckmanBAHREcxjfZdyiJeVTVHBqmYgG0U0DIDru8=
X-Received: by 2002:a05:622a:c1:b0:4e8:a307:a42b with SMTP id
 d75a77b69052e-4eb810215a0mr63223151cf.4.1761264087710; Thu, 23 Oct 2025
 17:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926002609.1302233-1-joannelkoong@gmail.com>
 <20250926002609.1302233-8-joannelkoong@gmail.com> <aPqDPjnIaR3EF5Lt@bfoster>
In-Reply-To: <aPqDPjnIaR3EF5Lt@bfoster>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 23 Oct 2025 17:01:16 -0700
X-Gm-Features: AS18NWCr2gof0qHy0win6WQh6W7_ZK9lH8ZiDMcoGInBYeRlL9GA5J28nTVuopc
Message-ID: <CAJnrk1aNrARYRS+_b0v8yckR5bO4vyJkGKZHB2788vLKOY7xPw@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] iomap: track pending read bytes more optimally
To: Brian Foster <bfoster@redhat.com>
Cc: brauner@kernel.org, miklos@szeredi.hu, djwong@kernel.org, 
	hch@infradead.org, hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 12:30=E2=80=AFPM Brian Foster <bfoster@redhat.com> =
wrote:
>
> On Thu, Sep 25, 2025 at 05:26:02PM -0700, Joanne Koong wrote:
> > Instead of incrementing read_bytes_pending for every folio range read i=
n
> > (which requires acquiring the spinlock to do so), set read_bytes_pendin=
g
> > to the folio size when the first range is asynchronously read in, keep
> > track of how many bytes total are asynchronously read in, and adjust
> > read_bytes_pending accordingly after issuing requests to read in all th=
e
> > necessary ranges.
> >
> > iomap_read_folio_ctx->cur_folio_in_bio can be removed since a non-zero
> > value for pending bytes necessarily indicates the folio is in the bio.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > Suggested-by: "Darrick J. Wong" <djwong@kernel.org>
> > ---
>
> Hi Joanne,
>
> I was throwing some extra testing at the vfs-6.19.iomap branch since the
> little merge conflict thing with iomap_iter_advance(). I end up hitting
> what appears to be a lockup on XFS with 1k FSB (-bsize=3D1k) running
> generic/051. It reproduces fairly reliably within a few iterations or so
> and seems to always stall during a read for a dedupe operation:
>
> task:fsstress        state:D stack:0     pid:12094 tgid:12094 ppid:12091 =
 task_flags:0x400140 flags:0x00080003
> Call Trace:
>  <TASK>
>  __schedule+0x2fc/0x7a0
>  schedule+0x27/0x80
>  io_schedule+0x46/0x70
>  folio_wait_bit_common+0x12b/0x310
>  ? __pfx_wake_page_function+0x10/0x10
>  ? __pfx_xfs_vm_read_folio+0x10/0x10 [xfs]
>  filemap_read_folio+0x85/0xd0
>  ? __pfx_xfs_vm_read_folio+0x10/0x10 [xfs]
>  do_read_cache_folio+0x7c/0x1b0
>  vfs_dedupe_file_range_compare.constprop.0+0xaf/0x2d0
>  __generic_remap_file_range_prep+0x276/0x2a0
>  generic_remap_file_range_prep+0x10/0x20
>  xfs_reflink_remap_prep+0x22c/0x300 [xfs]
>  xfs_file_remap_range+0x84/0x360 [xfs]
>  vfs_dedupe_file_range_one+0x1b2/0x1d0
>  ? remap_verify_area+0x46/0x140
>  vfs_dedupe_file_range+0x162/0x220
>  do_vfs_ioctl+0x4d1/0x940
>  __x64_sys_ioctl+0x75/0xe0
>  do_syscall_64+0x84/0x800
>  ? do_syscall_64+0xbb/0x800
>  ? avc_has_perm_noaudit+0x6b/0xf0
>  ? _copy_to_user+0x31/0x40
>  ? cp_new_stat+0x130/0x170
>  ? __do_sys_newfstat+0x44/0x70
>  ? do_syscall_64+0xbb/0x800
>  ? do_syscall_64+0xbb/0x800
>  ? clear_bhb_loop+0x30/0x80
>  ? clear_bhb_loop+0x30/0x80
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7fe6bbd9a14d
> RSP: 002b:00007ffde72cd4e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000068 RCX: 00007fe6bbd9a14d
> RDX: 000000000a1394b0 RSI: 00000000c0189436 RDI: 0000000000000004
> RBP: 00007ffde72cd530 R08: 0000000000001000 R09: 000000000a11a3fc
> R10: 000000000001d6c0 R11: 0000000000000246 R12: 000000000a12cfb0
> R13: 000000000a12ba10 R14: 000000000a14e610 R15: 0000000000019000
>  </TASK>
>
> It wasn't immediately clear to me what the issue was so I bisected and
> it landed on this patch. It kind of looks like we're failing to unlock a
> folio at some point and then tripping over it later..? I can kill the
> fsstress process but then the umount ultimately gets stuck tossing
> pagecache [1], so the mount still ends up stuck indefinitely. Anyways,
> I'll poke at it some more but I figure you might be able to make sense
> of this faster than I can.
>
> Brian

Hi Brian,

Thanks for your report and the repro instructions. I will look into
this and report back what I find.

Thanks,
Joanne
>
> [1] umount stack trace:
>
> task:umount          state:D stack:0     pid:12216 tgid:12216 ppid:2514  =
 task_flags:0x400100 flags:0x00080001
> Call Trace:
>  <TASK>
>  __schedule+0x2fc/0x7a0
>  schedule+0x27/0x80
>  io_schedule+0x46/0x70
>  folio_wait_bit_common+0x12b/0x310
>  ? __pfx_wake_page_function+0x10/0x10
>  truncate_inode_pages_range+0x42a/0x4d0
>  xfs_fs_evict_inode+0x1f/0x30 [xfs]
>  evict+0x112/0x290
>  evict_inodes+0x209/0x230
>  generic_shutdown_super+0x42/0x100
>  kill_block_super+0x1a/0x40
>  xfs_kill_sb+0x12/0x20 [xfs]
>  deactivate_locked_super+0x33/0xb0
>  cleanup_mnt+0xba/0x150
>  task_work_run+0x5c/0x90
>  exit_to_user_mode_loop+0x12f/0x170
>  do_syscall_64+0x1af/0x800
>  ? vfs_statx+0x80/0x160
>  ? do_statx+0x62/0xa0
>  ? __x64_sys_statx+0xaf/0x100
>  ? do_syscall_64+0xbb/0x800
>  ? __x64_sys_statx+0xaf/0x100
>  ? do_syscall_64+0xbb/0x800
>  ? count_memcg_events+0xdd/0x1b0
>  ? handle_mm_fault+0x220/0x340
>  ? do_user_addr_fault+0x2c3/0x7f0
>  ? clear_bhb_loop+0x30/0x80
>  ? clear_bhb_loop+0x30/0x80
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7fdd641ed5ab
> RSP: 002b:00007ffd671182e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 0000559b3e2056b0 RCX: 00007fdd641ed5ab
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000559b3e205ac0
> RBP: 00007ffd671183c0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000103 R11: 0000000000000246 R12: 0000559b3e2057b8
> R13: 0000000000000000 R14: 0000559b3e205ac0 R15: 0000000000000000
>  </TASK>
>

