Return-Path: <linux-doc+bounces-2557-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DE87EF58C
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 16:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D43781C209AD
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 15:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CF332C7E;
	Fri, 17 Nov 2023 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YnZMivVL"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678291706;
	Fri, 17 Nov 2023 07:42:56 -0800 (PST)
Received: from localhost (unknown [75.104.68.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5F22144A;
	Fri, 17 Nov 2023 15:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5F22144A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700235776; bh=y5uEFwYQ2yewPkjfR6+VJLmqWoBBC8vTFyqS4NCQCkg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YnZMivVLK3liC2PcXQ6p5IxcE82VN32R7yai4c8viHHfKZ/K3+wsKaXR/Lj5Er59f
	 +JSONrVZnn78ydyuzSMQD1RtJIFPp7iWXfWAxRsyMstt4g1lC2snZQECrA49JNfKJb
	 SZeKQ6Y2z3eeVpsyN/6PeqUi325H7w2uvZktQuWX3UY5sCe/3VVK70JyLXDBOtrUX3
	 VgPnDMrGrcPiO9kqmprSyeK7e3AjyhHIyL7nda0+yb9KyYri/F0a6psUb+rfXej86T
	 KEehhaVPIChEueKQIVYjOnHb/0ojhaOtArPXe6m3AJ6SGqvEz/fwB1YC5i3Ve9Yg7B
	 ckA9Rb177FPlQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Ariel Miculas <amiculas@cisco.com>, linux-doc@vger.kernel.org
Cc: serge@hallyn.com, Ariel Miculas <amiculas@cisco.com>, "Matthew Wilcox
 (Oracle)" <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: vfs: fix typo in struct xattr_handlers
In-Reply-To: <20231027152101.226296-1-amiculas@cisco.com>
References: <20231027152101.226296-1-amiculas@cisco.com>
Date: Fri, 17 Nov 2023 08:42:48 -0700
Message-ID: <87il60xu6f.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ariel Miculas <amiculas@cisco.com> writes:

> The structure is called struct xattr_handler, singular, not plural.
> Fixing the typo also makes it greppable with the whole word matching
> flag.
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>
> ---
>  Documentation/filesystems/vfs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 99acc2e98673..276a219ff8d9 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -437,7 +437,7 @@ field.  This is a pointer to a "struct inode_operations" which describes
>  the methods that can be performed on individual inodes.
>  
>  
> -struct xattr_handlers
> +struct xattr_handler
>  ---------------------

Applied, thanks.

jon

