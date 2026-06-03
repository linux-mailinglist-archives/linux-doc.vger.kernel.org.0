Return-Path: <linux-doc+bounces-90681-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id edAoOcX8H2qNtgAAu9opvQ
	(envelope-from <linux-doc+bounces-90681-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:07:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD863669B
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gjuSI+Mu;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90681-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90681-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74E39302976D
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 10:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D0A39D6C9;
	Wed,  3 Jun 2026 10:01:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C72153EA;
	Wed,  3 Jun 2026 10:01:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480879; cv=none; b=dfpXWOTsuZpcZbFqP+g/OvcgRmRUrihJF4Bgea3E2R117FPhnnfchP/RxjvG5qodQNXNydulu3tPd+RmND8rMUsBAzPD666kcDy6JSUYgm53qIojdfm0nKmHgwN7fj6WYCgnH4a+VdQwGng9aiMO38n5zrYVGsF5I06+lgcvZ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480879; c=relaxed/simple;
	bh=QxFBotsgB8UUnDrQLfItNgUhmUtkFQv1RM9zjbNOnUs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=YSiWNwEQHtyTuViEr+h5/Gywe6Ie06RZjm1UQypfGnQB1D/MDf/+mzXDNNEE6zfuft8oJ9nglxDI5PfnAdRW7rpAV86XddkVYOO/c/QYjMIDqpHvL7tupeYaGy7yAxdxaLfAnaJ543XBJs6ark4qDCdXRJPm6RbnmT+s7ztW0cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjuSI+Mu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3031F1F00893;
	Wed,  3 Jun 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780480878;
	bh=q0UEN0T6ZdBymDl9PpvYHn+oresFz/OvDTAtvxMlbog=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gjuSI+Muvpa64FsbQp0C798uC9heDmpv3fdEuh84z+86XBxG1fvEQ67e/vX8+wL7K
	 Y7rr2et3VW/Ny+hwumBYFnnt+Bpq83US7jerAsqO5Ald11hBK1RHwB2JEQrQkKmOjQ
	 0EfslI1ewAJMPW6RpqDuQFlvdoNwuXdwoKfK+sl5UdzUVmDuQQspUvRwFrWixz6c1/
	 HLw2Eq5uEFinQ3xWicCLCAos/nLRrYe4XMyXc1o+nti2tRVsov4/Cryr9DQL9/90XL
	 orlUdVKatU7mpJqzxzmCoKHBiPRiULCkShyXv+oApD/apilcFeKpSlS5gKXv9ITn6E
	 H1ijxviFEgHRg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/5] selftests/mm: make file helpers return errors
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260527142432.230127-2-sarthak.sharma@arm.com>
References: <20260527142432.230127-1-sarthak.sharma@arm.com>
 <20260527142432.230127-2-sarthak.sharma@arm.com>
Date: Wed, 03 Jun 2026 13:01:08 +0300
Message-Id: <178048086818.472368.16811711474077698399.b4-review@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sarthak.sharma@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:jgg@ziepe.ca,m:jhubbard@nvidia.com,m:peterx@redhat.com,m:leon@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:broonie@kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90681-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BFD863669B

On Wed, 27 May 2026 19:54:28 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:

Hi Sarthak,

>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 2eab2110ac6a..c2f97fe97e58 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -61,7 +62,9 @@ int thp_read_string(const char *name, const char * const strings[])
>  		exit(EXIT_FAILURE);
>  	}
>  
> -	if (!read_file(path, buf, sizeof(buf))) {
> +	ret = read_file(path, buf, sizeof(buf));
> +	if (ret < 0) {
> +		errno = -ret;
>  		perror(path);

Hmm, looks like those slipped ksft conversion :/

For kselftest compatibility this should be

	printf("# %s: %s (%d)\n", path, strerror(errno), errno);

> @@ -103,12 +106,18 @@ void thp_write_string(const char *name, const char *val)
>  		printf("%s: Pathname is too long\n", __func__);
>  		exit(EXIT_FAILURE);
>  	}
> -	write_file(path, val, strlen(val) + 1);
> +	ret = write_file(path, val, strlen(val) + 1);
> +	if (ret < 0) {
> +		errno = -ret;
> +		perror(path);
> +		exit(EXIT_FAILURE);

These seem to repeat themself, how about we move prints to read/write
helpers?

Then it wouldn't matter for the callers what the exact error was, and no
need for errno games.

>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 311fc5b4513e..290e5c29123e 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -703,62 +703,72 @@ int read_file(const char *path, char *buf, size_t buflen)
>  	int fd;
>  	ssize_t numread;
>  
> +	if (buflen < 2)
> +		return -EINVAL;

heh, this feels overly protective :)

-- 
Sincerely yours,
Mike.


