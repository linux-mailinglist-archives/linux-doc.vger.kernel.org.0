Return-Path: <linux-doc+bounces-95960-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5y5ZKNKQT2o4jwIAu9opvQ
	(envelope-from <linux-doc+bounces-95960-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 14:15:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CA730DF1
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 14:15:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q3Ae0MYm;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95960-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95960-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75DFE3013B62
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 12:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ED72DEA68;
	Thu,  9 Jul 2026 12:12:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C7221638D
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 12:12:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599156; cv=pass; b=biJAe8c3jP1gMPijQKz6d0/M42awbOdCAHI7PFTpRHKohRrC8HLJv79tg2ph+I6E+oLD8wzphQrcme8mAcl8drtl07ZVP1xgGm0KMQzG/WLoDh3jnBB/MdWW7yBNNFoNrXbiK/m+mmas5CZzZ+RyeSKk9SsQVRF/EZjL3K+TuSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599156; c=relaxed/simple;
	bh=zwiWiYsDppIktlruouILg8tzAw30tCwKKAoq8zReISg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNKqciR2uW2r7ZmJxzw+VIx3hguh9uTDl9cPmiv4Iwo1ixKdd4Ib+ThMc4JTc8DLSj16bgz++JpvHoafPlT8LpVJtjr27myFQu0GOCfRgT7Z8pl9ZSTo+9en5tYvC1rR7fg7Ev1ICykPvS8Ups5qQzaeospbJX4pF4QiGaSS0Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3Ae0MYm; arc=pass smtp.client-ip=209.85.219.49
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so8735196d6.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 05:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783599154; cv=none;
        d=google.com; s=arc-20260327;
        b=bMs6Euhp0woqbqstppt/wcy+S1pQKRVxKpOAESZ18yV3Z5VoL1qUW+2Et4jXu+Z1eb
         bU7nQ0iJNqUpLS+OxVkLZJyqMK8uJ8zqsawB5JUZCti36XE15xIqKNNzMnJpf17ZSFZ/
         BHEZuMDP7q3MO6haTppq4R5tyzyJCO3qtH3XPx4dt4wVKKjZLVd1vvX3aE1QDyRSLfGO
         EXhNuXyCDyBms0hO8HI9LDnpqQziKzXHn11jddi8FI8jA/tBd8oEP9nwMGgQ2TNL+3cP
         VKYVRY4QdvWGitw31jfpZzbeZ6OaDEN0ZA8ZYW3Hio4szQFd6GjLBnR5LXgbWzN4V4H3
         7ZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mxl4gTQYvP4QMzULGxqd9rXn/Yk7CnK/pf/p++h4E4c=;
        fh=JQtkNgAJzNPa/qaucRHd2VhMs3fv4GX6yhChEVoZ2Ek=;
        b=SQnvXbR/SH30ErH8Lxh+AIxZqO/SfsP0CJmv93r02+yjSYQUfGFlfmBoMEPT+o/Qkz
         dHoYGGr/957h8rQIsx8zENIpSD+i144SC61nMixlYegb2CbFM8RJDgFP5I3XASJ21xCq
         ZIG++hNBtVhTByux1luqmsdKbsY3dfvr0Xy7DxvuNU+gtYWc/T3wDPrqB6j+pqG4GMSU
         CwfCw/R6luh22jRejWa4pwNPvlMy5dUPaB5K5O6USWlmprglKVe+pt1i7o6MeKj1W/wB
         3+pcTDQhqE1aZIiHHkF4/khHin03UgZpuHS4a42bv0Ydg8D713lLNbBp7i/YPWTJwOO9
         Ygkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599154; x=1784203954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mxl4gTQYvP4QMzULGxqd9rXn/Yk7CnK/pf/p++h4E4c=;
        b=q3Ae0MYm2WarrR8CH8U6uQ145+aIbMVdNn+/hxh2r0KvEKewtKAr6bVS/YL2LuAQRb
         Op7Mqirb81w9Y0+khBV7V05UFw4TCPIHk6qWKDUCnVRrFV7C3XOb7xuBtWXwklZjj0o+
         rg8HkGQb5ZsGsITTnIilrn16YAZyeyOpHIsv3sJUb/vaz96rVZwZHJcAD74aSg1ynix6
         uUq265ykquIGzuVgsS8tZU9v/EIUyz/esBF/8hNSHcbFXuSCtQzMvja29wZEQBGxUy/4
         UsaINNsmieyj4YoBD9koeL2uKL/GVv+tE3E1U8aO+8MLy0L92TYKKo/IkAILytpdmnSq
         V0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599154; x=1784203954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mxl4gTQYvP4QMzULGxqd9rXn/Yk7CnK/pf/p++h4E4c=;
        b=I8BrEx1KHrokQvVYrIgF0hoIQEFS7ob0EIMLcWlmlAJIpK7LxuAL04g5uDnt9ah0Pc
         i9+KR/n1zrGvR6XhRN8+9+7P3O40FUBqTxKljyYqtfpDwBpSDS8NBvZOhOdILCpIbRk6
         JkTAoV5RIp6mzIjzZlPc670bsategc0rYUzLlYnGLOEU1i+uNlLwp9uRtoJV9ovK1dKg
         mAotqm97Jb+XVgu4x+CMqPyEbu4IKDZUhVMTofzd8CZRLqPz7u7S4Q8carA/xRiSLwUL
         sz3NUuld8ybx0lkk2sgHtvX7vtEfk6Fmy1hGdcICOcPGgwnZW1pi7Cerkpl/g/DdXl+A
         DsDw==
X-Gm-Message-State: AOJu0Yybu3t6FpUWZbf3uAQfoXoAPmxPXts4b0WMTp816+2V1QOJIesa
	Knp83tG6Ac+4fVPN2+dZmLlPPcTXYIMosUK4+K1Pv1tZwFUsllb/shR5OOdULj2qGKjbc/Cl3XR
	cUvtKhotpzDgP9DTqLO26kVI8hl4cR2WXl4YjMvI=
X-Gm-Gg: AfdE7cnBBm4zCgOdyNm+iKJxYqPKP/05nkHRSWSCzkhTa1vNl0zt6NTxBvXeTVQG6Sk
	mKDM2ySG9T3a1hrattopZmYd+1NbHmLSGrQIuWlYcwgBhhd0apOS403Dmx4ADfeDHoumDLAw8Xn
	yfuI8HWc4zHlQM1nxZq8fjSfWoVo4p1YqZTyNugvtb72CuX1B9RMLqnK3H4oIQ/askv2tMk5yEm
	0BlgPhokx2kxEPmnbc+7AVCIJVj+WJtQy5/HKKwhRrDaso3VKEY2FLnugT9CH9ILYEGM3tvc8tu
	p0QzQfGs31rKvQCF+W3G/rUrRS1eohDigiw8JgGeAOvK7Gpv2Xfv2emoN8WCbApa9Vij5ZXD+YL
	3yQedQ+wUHQ==
X-Received: by 2002:a05:6214:2dc3:b0:8f0:65c7:3237 with SMTP id
 6a1803df08f44-8fec02f1a14mr77715556d6.5.1783599153737; Thu, 09 Jul 2026
 05:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708130558.12604-1-igorgphotoarte@gmail.com>
In-Reply-To: <20260708130558.12604-1-igorgphotoarte@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 9 Jul 2026 09:12:22 -0300
X-Gm-Features: AUfX_mx7fpFj3e9ICFpT6wEk2eKM3a9OGuTh4lzgW7pjWBReQwYacE_8nUaiOBM
Message-ID: <CAMAsx6cpPDR=rXYj+Vj5sHO0_J3LEfNj_AgK5dwJBE_odsUUmg@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: process: Translate the kernel driver statement
To: Igor Giamoniano <igorgphotoarte@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:igorgphotoarte@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95960-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 161CA730DF1

Em qua., 8 de jul. de 2026 =C3=A0s 10:07, Igor Giamoniano
<igorgphotoarte@gmail.com> escreveu:
>
> Translate Documentation/process/kernel-driver-statement.rst into Brazilia=
n
> Portuguese, keeping the reStructuredText formatting and the list of
> signatories unchanged.
>
> Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
> ---
>  .../pt_BR/process/kernel-driver-statement.rst | 205 ++++++++++++++++++
>  1 file changed, 205 insertions(+)

Hi Igor,

Since this is a new file, you also need to add it to
Documentation/translations/pt_BR/index.rst so it connects to the main
documentation page.
Please add the file to the index, fix those rST formatting warnings we
found, and submit a v2.

Thanks!

