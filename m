Return-Path: <linux-doc+bounces-3519-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167EB7FDC35
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 17:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E431C20AA3
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 16:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243883987A;
	Wed, 29 Nov 2023 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgidGJBx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F9B14AB9;
	Wed, 29 Nov 2023 16:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3C7C433C7;
	Wed, 29 Nov 2023 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701274060;
	bh=deUo5Xr6ZgSeyKob2mhhkZFoNdVfH9Jwuteag02Tzho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgidGJBxvnjXp6S9i0BKR2lh2z8UX8KOEpWT6lHnx3fhPQhgRRQgsj0bFcWEPRpBr
	 7Iyra9WzUy7I3o7QEwO3eWm9Zfz5hyaUVJSh3hf6tW+5cR1ieyGNBQR9QBLZlR0fyn
	 3Kfd//ZajhV7FE5a4PyowLx7jYfDSPTm2MBenMqpcOidoATEMCFeZ9J4ulf6lC+RUK
	 Tz9wgk9ALTasT3pA/+JTP7Q+ng1xvfaT0MzzPrS6+MgL1SNMt6z58DcahwwwUVGr3l
	 E2Y2GD2+cG8Ohc6v0sglhQkdngviXmDUyGIqZG/drBbgmhd1DAjV0wU1V3SxW+36vT
	 zmQm2DEfw6IEw==
Date: Wed, 29 Nov 2023 08:07:40 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux XFS <linux-xfs@vger.kernel.org>,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Chandan Babu R <chandan.babu@oracle.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Dave Chinner <dchinner@redhat.com>,
	Steve French <stfrench@microsoft.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Allison Henderson <allison.henderson@oracle.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Han <hanchunchao@inspur.com>,
	Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH v3] Documentation: xfs: consolidate XFS docs into its own
 subdirectory
Message-ID: <20231129160740.GE361584@frogsfrogsfrogs>
References: <20231129123947.4706-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129123947.4706-1-bagasdotme@gmail.com>

On Wed, Nov 29, 2023 at 07:39:47PM +0700, Bagas Sanjaya wrote:
> XFS docs are currently in upper-level Documentation/filesystems.
> Although these are currently 4 docs, they are already outstanding as
> a group and can be moved to its own subdirectory.
> 
> Consolidate them into Documentation/filesystems/xfs/.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Looks good!
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
> Changes since v2 [1]:
> 
>   * Adjust MAINTAINERS pattern to include all docs in the subdirectory
>     by using wildcard.
> 
> [1]: https://lore.kernel.org/linux-doc/20231128124522.28499-1-bagasdotme@gmail.com/
> 
>  Documentation/filesystems/index.rst                |  5 +----
>  Documentation/filesystems/xfs/index.rst            | 14 ++++++++++++++
>  .../{ => xfs}/xfs-delayed-logging-design.rst       |  0
>  .../{ => xfs}/xfs-maintainer-entry-profile.rst     |  0
>  .../{ => xfs}/xfs-online-fsck-design.rst           |  2 +-
>  .../{ => xfs}/xfs-self-describing-metadata.rst     |  0
>  .../maintainer/maintainer-entry-profile.rst        |  2 +-
>  MAINTAINERS                                        |  4 ++--
>  8 files changed, 19 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/filesystems/xfs/index.rst
>  rename Documentation/filesystems/{ => xfs}/xfs-delayed-logging-design.rst (100%)
>  rename Documentation/filesystems/{ => xfs}/xfs-maintainer-entry-profile.rst (100%)
>  rename Documentation/filesystems/{ => xfs}/xfs-online-fsck-design.rst (99%)
>  rename Documentation/filesystems/{ => xfs}/xfs-self-describing-metadata.rst (100%)
> 
> diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
> index 09cade7eaefc8c..e18bc5ae3b35f8 100644
> --- a/Documentation/filesystems/index.rst
> +++ b/Documentation/filesystems/index.rst
> @@ -121,8 +121,5 @@ Documentation for filesystem implementations.
>     udf
>     virtiofs
>     vfat
> -   xfs-delayed-logging-design
> -   xfs-maintainer-entry-profile
> -   xfs-self-describing-metadata
> -   xfs-online-fsck-design
> +   xfs/index
>     zonefs
> diff --git a/Documentation/filesystems/xfs/index.rst b/Documentation/filesystems/xfs/index.rst
> new file mode 100644
> index 00000000000000..ab66c57a5d18ea
> --- /dev/null
> +++ b/Documentation/filesystems/xfs/index.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================
> +XFS Filesystem Documentation
> +============================
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :numbered:
> +
> +   xfs-delayed-logging-design
> +   xfs-maintainer-entry-profile
> +   xfs-self-describing-metadata
> +   xfs-online-fsck-design
> diff --git a/Documentation/filesystems/xfs-delayed-logging-design.rst b/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
> similarity index 100%
> rename from Documentation/filesystems/xfs-delayed-logging-design.rst
> rename to Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
> diff --git a/Documentation/filesystems/xfs-maintainer-entry-profile.rst b/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
> similarity index 100%
> rename from Documentation/filesystems/xfs-maintainer-entry-profile.rst
> rename to Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
> diff --git a/Documentation/filesystems/xfs-online-fsck-design.rst b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
> similarity index 99%
> rename from Documentation/filesystems/xfs-online-fsck-design.rst
> rename to Documentation/filesystems/xfs/xfs-online-fsck-design.rst
> index a0678101a7d02d..352516feef6ffe 100644
> --- a/Documentation/filesystems/xfs-online-fsck-design.rst
> +++ b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
> @@ -962,7 +962,7 @@ disk, but these buffer verifiers cannot provide any consistency checking
>  between metadata structures.
>  
>  For more information, please see the documentation for
> -Documentation/filesystems/xfs-self-describing-metadata.rst
> +Documentation/filesystems/xfs/xfs-self-describing-metadata.rst
>  
>  Reverse Mapping
>  ---------------
> diff --git a/Documentation/filesystems/xfs-self-describing-metadata.rst b/Documentation/filesystems/xfs/xfs-self-describing-metadata.rst
> similarity index 100%
> rename from Documentation/filesystems/xfs-self-describing-metadata.rst
> rename to Documentation/filesystems/xfs/xfs-self-describing-metadata.rst
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> index 7ad4bfc2cc038a..18cee1edaecb6f 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -105,4 +105,4 @@ to do something different in the near future.
>     ../driver-api/media/maintainer-entry-profile
>     ../driver-api/vfio-pci-device-specific-driver-acceptance
>     ../nvme/feature-and-quirk-policy
> -   ../filesystems/xfs-maintainer-entry-profile
> +   ../filesystems/xfs/xfs-maintainer-entry-profile
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea790149af7951..5ad039cfe9c794 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23893,10 +23893,10 @@ S:	Supported
>  W:	http://xfs.org/
>  C:	irc://irc.oftc.net/xfs
>  T:	git git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
> -P:	Documentation/filesystems/xfs-maintainer-entry-profile.rst
> +P:	Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
>  F:	Documentation/ABI/testing/sysfs-fs-xfs
>  F:	Documentation/admin-guide/xfs.rst
> -F:	Documentation/filesystems/xfs-*
> +F:	Documentation/filesystems/xfs/*
>  F:	fs/xfs/
>  F:	include/uapi/linux/dqblk_xfs.h
>  F:	include/uapi/linux/fsmap.h
> 
> base-commit: 9c235dfc3d3f901fe22acb20f2ab37ff39f2ce02
> -- 
> An old man doll... just what I always wanted! - Clara
> 
> 

