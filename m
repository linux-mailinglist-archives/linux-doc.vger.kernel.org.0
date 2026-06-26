Return-Path: <linux-doc+bounces-93664-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2cLgLCE4PmqeBgkAu9opvQ
	(envelope-from <linux-doc+bounces-93664-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 10:28:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F5D6CB566
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 10:28:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dZ6wUmHl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93664-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93664-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAAF431247EB
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363F23ECBED;
	Fri, 26 Jun 2026 08:21:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A00D3EC2DB;
	Fri, 26 Jun 2026 08:21:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462101; cv=none; b=rzkhuhFA4acair4ECU4BQjZ9WntqOJSncJ7+0UH1u/W/OxsxxCCCUtwiwUVTyXOAB54H+cswFJ0fNVWHFvsvTy5pB2VrSqRD98uqV6v9NQ4JASb0MOqjh3YDEoR8XLr7lSW05KDxI3uGbtjGcb0e0ShLY9qkdiEnKeQu045IYSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462101; c=relaxed/simple;
	bh=BZw4zLEIJKsrA2KEmFfZmq7q81BcD9V9sPPB2fDUK/A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Cln19Td2jKhOXDJnxQzwd6Fu4N22U0NIuQ2GeAKqURIuOV3ESujWBEERjD1JI2asKxOFPg2FdFOby2XHCfZ1izNY9uQQWCbq5lEzW2BSlFZqSMoQ3eKiVHeTM7W6YGcYNZlAG/l4YxdpPDiiFd63RdhffAZcEohN7CHbLTmonGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ6wUmHl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A601F000E9;
	Fri, 26 Jun 2026 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462099;
	bh=/URyDSaM1Mp00hYDxzcu1PlaeGQCy7y9ufaCKG+1pYk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dZ6wUmHlou3J6WeaopCIhZOzl5LxPzE65VLGwts7XKUdv71sYAo7u0DcmzHudoAeC
	 dUUU3ZBCDSL1NXw420mqK9HQKDWL+3Mf932mHOQbY5haEiBgbzgz+TvikEdOG8odvD
	 b1xMWbiwWliWZPzhGeLA+1YDYFPXwVtjUHD231hpuDUDCdBWWpz8fTMT2aNKlNClA0
	 auSTv8t3dvuaYganHC6zeXelxXxD1hJBswndcayL5cTEfGWd7sDNN5UuosA5B5UhWE
	 0iB4C44h6WSBaWEu/jEws2dH0VFYZi9QvILF/Ez8Hd6jBU8RVZlmVkL2yPhIEpb/tG
	 Z7rdZkOnXcovw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B8839389E8;
	Fri, 26 Jun 2026 08:21:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning
 backtraces
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <178246208674.3816447.9584369939582811196.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:26 +0000
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, brendan.higgins@linux.dev,
 david@davidgow.net, raemoar63@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, skhan@linuxfoundation.org, akpm@linux-foundation.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, peterz@infradead.org, acarmina@redhat.com,
 linux@roeck-us.net, kees@kernel.org, lkft@linaro.org, mcanal@igalia.com,
 error27@gmail.com, simona.vetter@ffwll.ch
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93664-lists,linux-doc=lfdr.de,linux-riscv];
	FREEMAIL_CC(0.00)[lists.infradead.org,arndb.de,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,linuxfoundation.org,linux-foundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,vger.kernel.org,googlegroups.com,lists.freedesktop.org,infradead.org,redhat.com,roeck-us.net,linaro.org,igalia.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:linux-riscv@lists.infradead.org,m:arnd@arndb.de,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:dri-devel@lists.freedesktop.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:acarmina@redhat.com,m:linux@roeck-us.net,m:kees@kernel.org,m:lkft@linaro.org,m:mcanal@igalia.com,m:error27@gmail.com,m:simona.vetter@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64F5D6CB566

Hello:

This series was applied to riscv/linux.git (fixes)
by Shuah Khan <skhan@linuxfoundation.org>:

On Fri, 15 May 2026 14:29:31 +0200 you wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons:
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> [...]

Here is the summary with links:
  - [v13,1/4] bug/kunit: Core support for suppressing warning backtraces
    (no matching commit)
  - [v13,2/4] kunit: Add backtrace suppression self-tests
    (no matching commit)
  - [v13,3/4] drm: Suppress intentional warning backtraces in scaling unit tests
    (no matching commit)
  - [v13,4/4] kunit: Add documentation for warning backtrace suppression API
    https://git.kernel.org/riscv/c/5c1553dd5db3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



