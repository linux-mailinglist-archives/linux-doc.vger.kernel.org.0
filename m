Return-Path: <linux-doc+bounces-47950-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C424ACB9E2
	for <lists+linux-doc@lfdr.de>; Mon,  2 Jun 2025 18:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A6A0189B9C3
	for <lists+linux-doc@lfdr.de>; Mon,  2 Jun 2025 16:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27714224AFA;
	Mon,  2 Jun 2025 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XhRhv1pn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057652236FB
	for <linux-doc@vger.kernel.org>; Mon,  2 Jun 2025 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883201; cv=none; b=Mxk3e7/bhBPbtJPKvBJKT9CsZo0VGjrbSur439L5VNcTe8ZOJ288h4+hDSHByAfeq8AL/ukNNo+tSUAsr8nE6XkNs2TF5mHx4e/nGoN2TFKkckTSQ8/ENZTPF8IlrgHBYB5IxFRXOppuX2SXNwdEH3dhWLNnqwHpA6y2QZRuPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883201; c=relaxed/simple;
	bh=sNnLuhKO3AReaOzRIspErHSF5xPJfYKaxZ8sZbVkEh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgIFoxx+i+r/4PM0KWZy2Qwc+QgsCUZXkLXI6hti768FjlZiPYuSyBLI5gQGvhHfTMGEpx442uZCoWoZawGhpdVaI9qu6EtY+orYqP7PpFezqW2fbiqRpEg17FIS0fZhtZKkXdti02MMQQmACMVQEd3Y4MOGGwgysMBJBNv8Ols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XhRhv1pn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d3f72391so23689645e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Jun 2025 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748883196; x=1749487996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5agi1qs9OW78m3JphTzvG7DfpG3RNEiOQUPRyolTd6E=;
        b=XhRhv1pnnGjlDoo1gJU3hpFr3LZuzQUb4lcHlAZcU/5zyfr1+HFPodaXiwiZXt+aVG
         /Qc35uq/fbXCx5lAOU6wtIbUvvqm00E7m56/wng7eQZlqsP0hAlXyofd5IvkA9oyHn0y
         WvTHtPdrdtvzyLhEhsXbzEz0mJ6KoUXLyJiXwXELPmFRpQC6abQmWbHnkwy9yEt6pzu7
         Kyu3mJ08CSpKChKtd3c0RzwVmor7WF1SkGM8zOMeCUWKsxcSMl+4MFLGEDFAM83rQQtX
         +djQquhW9KX99SxPCpwDYgMEEYBlxGVR9Na+xrqKPNH1yGz0LmmHB1DKMzcyn5PbEjqx
         N9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748883196; x=1749487996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5agi1qs9OW78m3JphTzvG7DfpG3RNEiOQUPRyolTd6E=;
        b=izxhaRG8mxBCANL6cWnEkwHZY18J+psmsE6USgkN4epTRL+SF4tm18iRhRvazMdy7N
         dC8WWkarB8bi/fYh0/6Cdf1saMIgUqcVctnhocXcP/bacRTZGvXqm/doK5vIFdru281W
         O7ryqsJtmNicmYF211LcBLwHEa3G44AtgtUVSt5/FkQrK70i1qqSWdLXu5quuI5CCt2/
         ff+jahIjiomi3vTFXWu3yRhoCU1wqvNlP3Syz+2cn9kOQql3zSA0REZVuO1rQMkwq0eH
         EoV+Ap++t/7ApYhsFpEcJLsKOcZ705qWWOsKuDaDnwp+AZgHc+YAGT61SYIYVyUs0WSB
         6nyA==
X-Forwarded-Encrypted: i=1; AJvYcCUCjaF/xwt5UC9mC8DDPw0mscNMlvVQ6Lhg/cDNMWGXr5fBIU6Cia2GKNFaOmC5qv2bUREq/JSv8Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3xSK16ROoNNWRH9Nd0P5N6550KHHjQ3lq3BriY8mRSAUh6twy
	WXpk0MaYjChLZFTTZwS7GL/RkiPubeyEWn8AGcdWTCu80Rm0y8/p65roAE/26G9m36U=
X-Gm-Gg: ASbGnctZxhdCR/eCL7I8/2J1SE/JW4sPTTa+bacC9xlgjldhb1/M4n5QJDTfN+mFlM4
	DSAPP9oMpqVRVuBTy8+hqYPzQsRF4/vMf6MuHwnE7SKbZzwoj5KUn/GObfxxWokgIPLrYgvYVxM
	ETgyYsOySazMRFnxStWpEfz0lxv+Zy6Hfztoca1y5GD8GRn5jo3w+NufXF4QZjO0hoYmmx2Mbme
	rTnwPCmR/MK4TCfWWmcaLoRapyzGsjHqfDsu6jOcIY1OWw6E2dlgnx7olmfyN8TUEqZ0cTCjBss
	sUm/eAnlJfKTi5p9rw1Uu6zu8663Or245QfX0z3NIHkh4kxF8CWDww==
X-Google-Smtp-Source: AGHT+IHIE0h8ks2B24+GvFatYdBhkFfv8FzjJdWIaF0OkvJ4PLpG5qpKqArlSVDjF/Tm2wElewMocA==
X-Received: by 2002:a05:6000:40cb:b0:3a3:7987:945e with SMTP id ffacd0b85a97d-3a4f89df65dmr10778901f8f.56.1748883196046;
        Mon, 02 Jun 2025 09:53:16 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b7b0sm15609636f8f.10.2025.06.02.09.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:53:15 -0700 (PDT)
Date: Mon, 2 Jun 2025 18:53:13 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, peterz@infradead.org, 
	akpm@linux-foundation.org, mingo@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	corbet@lwn.net, mgorman@suse.de, mhocko@kernel.org, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, tim.c.chen@intel.com, aubrey.li@intel.com, libo.chen@oracle.com, 
	kprateek.nayak@amd.com, vineethr@linux.ibm.com, venkat88@linux.ibm.com, ayushjai@amd.com, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yu.chen.surf@foxmail.com
Subject: Re: [PATCH v5 2/2] sched/numa: add statistics of numa balance task
Message-ID: <djkzirwswrvhuuloyitnhxcm3sh7ebk6i22tvq2zzm4cb6pl45@t64jvtpl3ys6>
References: <cover.1748002400.git.yu.c.chen@intel.com>
 <7ef90a88602ed536be46eba7152ed0d33bad5790.1748002400.git.yu.c.chen@intel.com>
 <cx4s4pnw5ymr4bxxmvrkhc457krq46eh6zamlr4ikp7tn3jsno@xzchjlnnawe5>
 <uuhyie7udxyvbdpccwi7dl5cy26ygkkuxjixpl247u5nqwpcqm@5whxlt5ddswo>
 <a8314889-f036-49ff-9cda-01367ddccf51@intel.com>
 <fpa42ohp54ewxxymaclnmiafdlfs7lbddnqhtv7haksdd5jq6z@mb6jxk3pl2m2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g6yleufkzt7awgj3"
Content-Disposition: inline
In-Reply-To: <fpa42ohp54ewxxymaclnmiafdlfs7lbddnqhtv7haksdd5jq6z@mb6jxk3pl2m2>


--g6yleufkzt7awgj3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] sched/numa: add statistics of numa balance task
MIME-Version: 1.0

On Tue, May 27, 2025 at 11:15:33AM -0700, Shakeel Butt <shakeel.butt@linux.=
dev> wrote:
> I am now more inclined to keep these new stats in memory.stat as the
> current version is doing because:
>=20
> 1. Relevant stats are exposed through the same interface and we already
>    have numa balancing stats in memory.stat.
>=20
> 2. There is no single good home for these new stats and exposing them in
>    cpu.stat would require more code and even if we reuse memcg infra, we
>    would still need to flush the memcg stats, so why not just expose in
>    the memory.stat.
>=20
> 3. Though a bit far fetched, I think we may add more stats which sit at
>    the boundary of sched and mm in future. Numa balancing is one
>    concrete example of such stats. I am envisioning for reliable memory
>    reclaim or overcommit, there might be some useful events as well.
>    Anyways it is still unbaked atm.
>=20
>=20
> Michal, let me know your thought on this.

I reckon users may be little bit more likely to look that info in
memory.stat.

Which would be OK unless threaded subtrees are considered (e.g. cpuset
(NUMA affinity) has thread granularity) and these migration stats are
potentially per-thread relevant.


I was also pondering why cannot be misplaced container found by existing
NUMA stats. Chen has explained task vs page migration in NUMA balancing.
I guess mere page migration number (especially when stagnating) may not
point to the the misplaced container. OK.

Second thing is what is the "misplaced" container. Is it because of
wrong set_mempolicy(2) or cpuset configuration? If it's the former (i.e.
it requires enabled cpuset controller), it'd justify exposing this info
in cpuset.stat, if it's the latter, the cgroup aggregation is not that
relevant (hence /proc/<PID>/sched) is sufficient. Or is there another
meaning of a misplaced container? Chen, could you please clarify?

Because memory controller doesn't control NUMA, it needn't be enabled
to have this statistics and it cannot be enabled in threaded groups, I'm
having some doubts whether memory.stat is a good home for this field.

Regards,
Michal

--g6yleufkzt7awgj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaD3W9wAKCRAt3Wney77B
Sd2uAP99fRZB3zwdhHyZCwIbpZAgx51Hl8FgeZoZxCpyovrMGgEA39M62oE0rmZz
mcKZRPReYjxX0Ty4SyIIK75L/yiX4Qs=
=IOWj
-----END PGP SIGNATURE-----

--g6yleufkzt7awgj3--

