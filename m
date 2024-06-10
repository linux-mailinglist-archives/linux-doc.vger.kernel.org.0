Return-Path: <linux-doc+bounces-18165-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C729029C4
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 22:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0195C1C231A5
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 20:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB5014F9EC;
	Mon, 10 Jun 2024 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="LYwY4ug2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC7814F9CE
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050351; cv=none; b=YiuqE10TPo2naNmT4pTwLQ4L2AAzWndMWSNIGJMvUZFHmEC6GKMh14pi86I1P5C2EL+gNBPzQq2eV1OLk8Za6VAnCUmoSS5NhRdw0JzmAkp2/z0kz0rhlHBc6mU3tYxE6Iq0bOJzN9CMU8dgYnwW3tA+7FBAk8jkbfPejewindE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050351; c=relaxed/simple;
	bh=b7+MwoWNMLPQ7YyhI/4+4s4P3K4STGUIbLhPZG0Mamc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amb9M4ZOT7oDX07ss0JDZrQO/u7v7gna1z6+lOmakg79FnIfyEASifWlMIHW66mGylLtuKeTVo86lmWiRAf2NW71sfDiuVZqnbXu/C5JB02Pvdrvu2nasxOSF8dUc/hJPSYb1OZhk2BBlCgewC/bOAS6pi/CQOkSTsQUc5zXEYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=LYwY4ug2; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62a087c3a92so48860437b3.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1718050348; x=1718655148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8U88OhWZh1tCo+0WQ1tID8xLxoIwnJftDZHFtRwK3o=;
        b=LYwY4ug2iL/vJ4DIUm0/Hp2MvpGURHFsHfCR8hKgvsmAqgzRPxBeFZzp5Tfo48EbCo
         Euj3YFKE98R3xDK+TVi4X08MQrChZxoR0ZdwAIKYcBEyuT6J6pRA6MFIWpmGlK1QH6yk
         ayaE24UINt0NKI07iU6nbvvP+ur4CK0DddjWE0Gtpl8JlrD2yRSechl/xjLYVx0XPb6G
         i76retKit/NIZmraE8AuogV1B4ponmQt72v7gY3tzehh7ckEOuDJ8LHGOKzXVFo5n2E+
         4LMkjHweMxF1v6LeN1NaZpvEMI8QBe5KxGttDTh645mywME2cc7oJs1j5M/rPYABPg7M
         UNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718050348; x=1718655148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8U88OhWZh1tCo+0WQ1tID8xLxoIwnJftDZHFtRwK3o=;
        b=hh9PhucRREtfaD6YuQFFKEnGKkBsSR1ELZcHNl3v54Ez8SKmVOEkUSSn/BrVgP2OX7
         npDVx7uhIRC955lOryyTUOD4MryKZTtB/wTRRDRAZuYX46I58xhU4S2fLywQbZebxe7q
         bpfhHu/FN7lY9AJJDIv9ZbTXUaCBNglLhe/7/1Dqd1EC11ce1OLlm9QZiiLFA8PvDJVA
         4oCmuFfn4s5dFEuMPjwY6u3OsIK6/7Yq5c8iy8VDVUuDX5iWyHg0k3MPOSSP1GLCbvLU
         95BZyqK7e3S10Ij0lZ5KVVmSOwZ40etOuX0m2zRNg5uIOScnQm4jS6qtAXnOSILn3+W0
         1RRg==
X-Forwarded-Encrypted: i=1; AJvYcCWQRNLovJ5G0nwLqgGhTREPoON8vNs9UWTrkuGRk7mWoAA9KM2v6FNGloXIImxfsocebtTOPhRB34cDBPaVcFNLiRpgbmCM2QoT
X-Gm-Message-State: AOJu0YwVdgnPmeP1yR8OpN1T++tiH19hboEEGY+LdS8XD+8Wuk9fAlu6
	MJdT7viiColeU2uai1i2bijZtR4bMR3S2ZaVCAI7RoLtOsK67k1KkkH8NLREe2k=
X-Google-Smtp-Source: AGHT+IHAq2uat/BxStlvycvWIMemf9chq6bKvr5RgwVh7JekY7oKEJ33MFsCJYBOa4s18l+17nIrDA==
X-Received: by 2002:a81:ef0e:0:b0:61a:f206:bad6 with SMTP id 00721157ae682-62cd55f6755mr90104707b3.30.1718050348318;
        Mon, 10 Jun 2024 13:12:28 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccaef2825sm17372997b3.139.2024.06.10.13.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 13:12:27 -0700 (PDT)
Date: Mon, 10 Jun 2024 16:12:27 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Cc: brauner@kernel.org, ebiederm@xmission.com,
	Jonathan Corbet <corbet@lwn.net>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>, Joel Granados <j.granados@samsung.com>,
	John Johansen <john.johansen@canonical.com>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	containers@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	apparmor@lists.ubuntu.com, keyrings@vger.kernel.org,
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Introduce user namespace capabilities
Message-ID: <20240610201227.GD235772@perftesting>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240609104355.442002-1-jcalmels@3xx0.net>

On Sun, Jun 09, 2024 at 03:43:33AM -0700, Jonathan Calmels wrote:
> This patch series introduces a new user namespace capability set, as
> well as some plumbing around it (i.e. sysctl, secbit, lsm support).
> 
> First patch goes over the motivations for this as well as prior art.
> 
> In summary, while user namespaces are a great success today in that they
> avoid running a lot of code as root, they also expand the attack surface
> of the kernel substantially which is often abused by attackers. 
> Methods exist to limit the creation of such namespaces [1], however,
> application developers often need to assume that user namespaces are
> available for various tasks such as sandboxing. Thus, instead of
> restricting the creation of user namespaces, we offer ways for userspace
> to limit the capabilities granted to them.
> 
> Why a new capability set and not something specific to the userns (e.g.
> ioctl_ns)?
> 
>     1. We can't really expect userspace to patch every single callsite
>     and opt-in this new security mechanism. 
> 
>     2. We don't necessarily want policies enforced at said callsites.
>     For example a service like systemd-machined or a PAM session need to
>     be able to place restrictions on any namespace spawned under it.
> 
>     3. We would need to come up with inheritance rules, querying
>     capabilities, etc. At this point we're just reinventing capability
>     sets.
> 
>     4. We can easily define interactions between capability sets, thus
>     helping with adoption (patch 2 is an example of this)
> 
> Some examples of how this could be leveraged in userspace:
> 
>     - Prevent user from getting CAP_NET_ADMIN in user namespaces under SSH:
>         echo "auth optional pam_cap.so" >> /etc/pam.d/sshd
>         echo "!cap_net_admin $USER"     >> /etc/security/capability.conf
>         capsh --secbits=$((1 << 8)) -- -c /usr/sbin/sshd
> 
>     - Prevent containers from ever getting CAP_DAC_OVERRIDE:
>         systemd-run -p CapabilityBoundingSet=~CAP_DAC_OVERRIDE \
>                     -p SecureBits=userns-strict-caps \
>                     /usr/bin/dockerd
>         systemd-run -p UserNSCapabilities=~CAP_DAC_OVERRIDE \
>                     /usr/bin/incusd
> 
>     - Kernel could be vulnerable to CAP_SYS_RAWIO exploits, prevent it:
>         sysctl -w cap_bound_userns_mask=0x1fffffdffff
> 
>     - Drop CAP_SYS_ADMIN for this shell and all the user namespaces below it:
>         bwrap --unshare-user --cap-drop CAP_SYS_ADMIN /bin/sh
> 

Where are the tests for this patchset?  I see you updated the bpf tests for the
bpf lsm bits, but there's nothing to validate this new behavior or exercise the
new ioctl you've added.  Thanks,

Josef

