Return-Path: <linux-doc+bounces-2695-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E47CB7F17B8
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 16:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5AF1F24D9C
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 15:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DB61DA40;
	Mon, 20 Nov 2023 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from p3plwbeout26-04.prod.phx3.secureserver.net (p3plsmtp26-04-2.prod.phx3.secureserver.net [216.69.139.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA8FA7
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 07:45:42 -0800 (PST)
X-MW-NODE: 
X-CMAE-Analysis: v=2.4 cv=PKnKRdmC c=1 sm=1 tr=0 ts=655b7f26
 a=dFffxkGDbYo3ckkjzRcKYg==:117 a=dFffxkGDbYo3ckkjzRcKYg==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=AUd_NHdVAAAA:8 a=FXvPX3liAAAA:8
 a=VwQbUJbxAAAA:8 a=0wROvl3FcpXzi9APqyUA:9 a=QEXdDO2ut3YA:10
 a=EebzJV9D4rpJJoWO5PQE:22 a=UObqyxdv-6Yh2QiB9mM_:22 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
X-SID: 56SwrEXQirdjV
Date: Mon, 20 Nov 2023 15:45:38 +0000 (GMT)
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Ariel Miculas <amiculas@cisco.com>, linux-doc@vger.kernel.org,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: serge@hallyn.com, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Message-ID: <1582596779.2062926.1700495138062@eu1.myprofessionalmail.com>
In-Reply-To: <20231117161215.140282-1-amiculas@cisco.com>
References: <20231117161215.140282-1-amiculas@cisco.com>
Subject: Re: [PATCH v3] docs: filesystems: document the squashfs specific
 mount options
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.18.49
X-Originating-IP: 82.69.79.175
X-Originating-Client: open-xchange-appsuite
X-CMAE-Envelope: MS4xfAZiPASMa9f/Vcpg2yN+a6ntu9MU8kCketYebboNEff/9iudapY5Jn5liTRXR99fcAFhJy4IizIy5PDaPQAvsWjKK9i9HDzXCWtv4myqH/Im/THX0b0e
 69NVIlpZmQFRX6rUgemXdLmlXXj2FTfZmHwz0tj6vj+fa/uKvf0fBt9w593PIykCjEQvC5lXRCCuW0k36LWotdUFmF32DJlBUtOYzM/2XrrIuHpgs5Uf2dY4
 t+kUFtp0UO4FAXRPXurLJ5A0ux9pZrt/rTcW6Df2LpyDYlN1iAgqj1D7LBqbK5JXdP0pgs1ki74jRcxPjLjT0CHNjh7JuZTbKdZtP7y2UQQWELGtd5eRPtrR
 g59BaRPWkPRlWh9j1RfpI1Lv+ND8l9yNpEhTjbeta9n1aaI+GKM=


> On 17/11/2023 16:12 GMT Ariel Miculas <amiculas@cisco.com> wrote:
> 
>  
> When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set, the "threads" mount option
> can be used to specify the decompression mode: single-threaded,
> multi-threaded, percpu or the number of threads used for decompression.
> When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set, SQUASHFS_DECOMP_MULTI
> and SQUASHFS_MOUNT_DECOMP_THREADS are both set, the "threads" option can
> also be used to specify the number of threads used for decompression.
> This mount option is only mentioned in fs/squashfs/Kconfig, which makes
> it difficult to find.
> 
> Another mount option available is "errors", which can be configured to
> panic the kernel when squashfs errors are encountered.
> 
> Add both these options to the squashfs documentation, making them more
> noticeable.
> 
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

I'm happy with this.

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>

> ---
> V2 -> V3: When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set, the "threads"
> mount option also requires SQUASHFS_MOUNT_DECOMP_THREADS to be set, in
> addition to SQUASHFS_DECOMP_MULTI
> 
> V1 -> V2: When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set, the "threads"
> mount option also requires SQUASHFS_DECOMP_MULTI to be set
> 
>  Documentation/filesystems/squashfs.rst | 60 ++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/Documentation/filesystems/squashfs.rst b/Documentation/filesystems/squashfs.rst
> index df42106bae71..4af8d6207509 100644
> --- a/Documentation/filesystems/squashfs.rst
> +++ b/Documentation/filesystems/squashfs.rst
> @@ -64,6 +64,66 @@ obtained from this site also.
>  The squashfs-tools development tree is now located on kernel.org
>  	git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
>  
> +2.1 Mount options
> +-----------------
> +===================    =========================================================
> +errors=%s              Specify whether squashfs errors trigger a kernel panic
> +                       or not
> +
> +		       ==========  =============================================
> +                         continue  errors don't trigger a panic (default)
> +                            panic  trigger a panic when errors are encountered,
> +                                   similar to several other filesystems (e.g.
> +                                   btrfs, ext4, f2fs, GFS2, jfs, ntfs, ubifs)
> +
> +                                   This allows a kernel dump to be saved,
> +                                   useful for analyzing and debugging the
> +                                   corruption.
> +                       ==========  =============================================
> +threads=%s             Select the decompression mode or the number of threads
> +
> +                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set:
> +
> +		       ==========  =============================================
> +                           single  use single-threaded decompression (default)
> +
> +                                   Only one block (data or metadata) can be
> +                                   decompressed at any one time. This limits
> +                                   CPU and memory usage to a minimum, but it
> +                                   also gives poor performance on parallel I/O
> +                                   workloads when using multiple CPU machines
> +                                   due to waiting on decompressor availability.
> +                            multi  use up to two parallel decompressors per core
> +
> +                                   If you have a parallel I/O workload and your
> +                                   system has enough memory, using this option
> +                                   may improve overall I/O performance. It
> +                                   dynamically allocates decompressors on a
> +                                   demand basis.
> +                           percpu  use a maximum of one decompressor per core
> +
> +                                   It uses percpu variables to ensure
> +                                   decompression is load-balanced across the
> +                                   cores.
> +                        1|2|3|...  configure the number of threads used for
> +                                   decompression
> +
> +                                   The upper limit is num_online_cpus() * 2.
> +                       ==========  =============================================
> +
> +                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set and
> +                       SQUASHFS_DECOMP_MULTI, SQUASHFS_MOUNT_DECOMP_THREADS are
> +                       both set:
> +
> +		       ==========  =============================================
> +                          2|3|...  configure the number of threads used for
> +                                   decompression
> +
> +                                   The upper limit is num_online_cpus() * 2.
> +                       ==========  =============================================
> +
> +===================    =========================================================
> +
>  3. Squashfs Filesystem Design
>  -----------------------------
>  
> -- 
> 2.42.1

