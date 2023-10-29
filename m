Return-Path: <linux-doc+bounces-1344-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D79FC7DAC8E
	for <lists+linux-doc@lfdr.de>; Sun, 29 Oct 2023 13:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58D861F2188B
	for <lists+linux-doc@lfdr.de>; Sun, 29 Oct 2023 12:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2917F3C39;
	Sun, 29 Oct 2023 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137A2591
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 12:54:50 +0000 (UTC)
X-Greylist: delayed 165 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 29 Oct 2023 05:54:48 PDT
Received: from p3plwbeout27-04.prod.phx3.secureserver.net (p3plsmtp27-04-2.prod.phx3.secureserver.net [216.69.139.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE61B8
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 05:54:48 -0700 (PDT)
Received: from mailex.mailcore.me ([94.136.40.141])
	by :WBEOUT: with ESMTP
	id x5GsqmsyHEGwpx5GsqUYr1; Sun, 29 Oct 2023 05:52:03 -0700
X-CMAE-Analysis: v=2.4 cv=Z7spoFdA c=1 sm=1 tr=0 ts=653e5573
 a=bheWAUFm1xGnSTQFbH9Kqg==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=AUd_NHdVAAAA:8
 a=VwQbUJbxAAAA:8 a=vaoKmyfopMuWMe4x9wgA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: x5GsqmsyHEGwp
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=[192.168.178.90])
	by smtp07.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1qx5Gx-0005xc-L4; Sun, 29 Oct 2023 12:52:08 +0000
Message-ID: <9596fa83-f06c-5582-7f99-c99c67e73dba@squashfs.org.uk>
Date: Sun, 29 Oct 2023 12:51:59 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] docs: filesystems: document the squashfs specific mount
 options
To: Ariel Miculas <amiculas@cisco.com>, linux-doc@vger.kernel.org
Cc: serge@hallyn.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org
References: <20231027150814.217689-1-amiculas@cisco.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20231027150814.217689-1-amiculas@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated:  phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfPW1OAFQJkflB7NKjk294hyFcn5+1eoM+/3+3IvNWWAsoaQPRrZEQeeTRJiyNihPIFEE9MncUbbHiy7VyFuccVI+aGpjEpArA4THsJZ5+IZyUxKgp8Ia
 sTNzNUlqPV5G+3tXkVENxfksUbimQi4kj1vv1FwwSTWee9nlsHOrtDBHE5EfEVN2/D39mgJnkBSIW8LlaGsWakM7DHtZEiayMPXkou/GJBRznWqZxLKxEFMw
 IqKxsI47FX94qZEgNYZF0Q==

On 27/10/2023 16:08, Ariel Miculas wrote:
> When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set, the "threads" mount option
> can be used to specify the decompression mode: single-threaded,
> multi-threaded or percpu. It can also be used to specify the number of
> threads used for decompression.
> This option is only mentioned in fs/squashfs/Kconfig, which makes it
> difficult to find.
> 
> Another mount option available is "errors", which can be configured to
> panic the kernel when squashfs errors are encountered.
> 
> Add both these options to the squashfs documentation, making them more
> noticeable.
> 
> Signed-off-by: Ariel Miculas <amiculas@cisco.com
Good idea to add the options to the Squashfs documentation.

Unfortunately some of the information in the patch is incorrect ... I've
commented below where that is.

So NAK this patch.  Please correct and send a V2 patch.

Thanks

Phillip

> ---
>   Documentation/filesystems/squashfs.rst | 58 ++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/filesystems/squashfs.rst b/Documentation/filesystems/squashfs.rst
> index df42106bae71..f71ac870603b 100644
> --- a/Documentation/filesystems/squashfs.rst
> +++ b/Documentation/filesystems/squashfs.rst
> @@ -64,6 +64,64 @@ obtained from this site also.
>   The squashfs-tools development tree is now located on kernel.org
>   	git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
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
> +                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set:

In this case it also depends on the SQUASHFS_DECOMP_MULTI decompressor
having been selected.  In otherwords threads=xxx won't work if the
single threaded (SQUASHFS_DECOMP_SINGLE) or percpu threaded
(SQUASHFS_DECOMP_MULTI_PERCPU) decompressors have been selected at build
time.

The reason for this is quite simple, due to their implementation the
number of threads they use is fixed and cannot be changed.

Changing the line to something like

If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set and
SQUASHFS_DECOMP_MULTI is set

should be OK here.

