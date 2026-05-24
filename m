Return-Path: <linux-doc+bounces-89263-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKIoKg0wE2pt8wYAu9opvQ
	(envelope-from <linux-doc+bounces-89263-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 24 May 2026 19:06:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2D5C3412
	for <lists+linux-doc@lfdr.de>; Sun, 24 May 2026 19:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3D8630004C4
	for <lists+linux-doc@lfdr.de>; Sun, 24 May 2026 17:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164C93AE1BC;
	Sun, 24 May 2026 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GD2Kmf73"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D71D3ACF12;
	Sun, 24 May 2026 17:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779642377; cv=none; b=YfqyFLWGDgJmFlFCeVVBxAamy7M+EZSbTegFniOzwSxTeNZ4pmlg2fZXolcEtyU7XRuxgsMxx+TvyZ4toWP4CZkz0DCaBYMx++dLWcWhyzrDUlnEDuSr+p3Md2r2b7ixYiXcwMTwTO7ggfxqGDAevHhD+bsEzSUKN3onfVCEOg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779642377; c=relaxed/simple;
	bh=6lb2GNcbA12GldTAhYLkYkCUGRytI9Rj/J+3kIv+icc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ex+kcMpmB18gdQm5ADZh87w0DVJbxXwJc4vBh4gTGZ3kmUf67nPk1PQZEv5bzoVNkLgiAnfDpSkz15fDomYWb3U0mz4HgOQJSmu46xJMUymlXANt685qvWzMkboau4fXKhN8KJP3LIXJ7MuJJJt4SdkofJH2zP5XxJq1CMCJPZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GD2Kmf73; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5041F000E9;
	Sun, 24 May 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779642372;
	bh=qU4t4qBcOzzk8o3HwKSTC0+TUYXIkGUhAgHkLXhocWU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GD2Kmf73ddPngym8JXZudPiNGdT0w+XfmVkjxpuvoeV7yOiSPKX/m5CaRRkhY7VEA
	 EUDy+QaCb6S1bSbrt0KR6NQem3WxDjudcFXcepSLPaniwofdCfpf6CYemegdWVeCEv
	 tdI4AswhXCjW0ilWKnVBsEMTbCfPrE7+wcmoEhkOJKv8Eu05OVsdJinoIaGVasg0H+
	 KAw1/OcSi3QWWv332PrkmsxxFUNNRL/87NqSrPVyPj8471YSnFSPh7h01YDHyq6kF/
	 apnDrwHd+tS8LgZU9Knkb5s/dcUUi05JQwb18XfK0hEmjuuzmRYUhPPF5ZLd+vnRrX
	 ksFoBSll6Y4nA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/4] tools/lib/mm: add shared file helpers
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260521111801.173019-2-sarthak.sharma@arm.com>
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
 <20260521111801.173019-2-sarthak.sharma@arm.com>
Date: Sun, 24 May 2026 20:06:02 +0300
Message-Id: <177964236205.4000040.3083558454897469696.b4-review@b4>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89263-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 59C2D5C3412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 16:47:58 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:

Hi Sarthak,

>
> diff --git a/tools/lib/mm/file_utils.c b/tools/lib/mm/file_utils.c
> new file mode 100644
> index 000000000000..0f9322f2cf41
> --- /dev/null
> +++ b/tools/lib/mm/file_utils.c
> @@ -0,0 +1,83 @@
> [ ... skip 48 lines ... ]
> +	saved_errno = errno;
> +	close(fd);
> +	errno = saved_errno;
> +	if (numwritten < 0) {
> +		fprintf(stderr, "%s write(%.*s) failed: %s\n",
> +			path, (int)(buflen - 1), buf, strerror(errno));

This would break TAP formatting for selftests.

> +		exit(EXIT_FAILURE);

and while EXIT_FAILURE == KSFT_FAIL I'm not sure it's robust enough.

>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 2eab2110ac6a..5e947abb7425 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -8,8 +8,9 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> +#include <mm/file_utils.h>
>  
> -#include "vm_util.h"

I think it would be fine to include file_utils.h in vm_utils.h and avoid
further churn.

-- 
Sincerely yours,
Mike.


