Return-Path: <linux-doc+bounces-47516-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A532DAC408C
	for <lists+linux-doc@lfdr.de>; Mon, 26 May 2025 15:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5443AEF83
	for <lists+linux-doc@lfdr.de>; Mon, 26 May 2025 13:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC07C1FDA89;
	Mon, 26 May 2025 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fzjEJjgp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72CC1F4CA0
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266553; cv=none; b=ojYtIVx2Y3Y1XxpnSDJqidZ4m+5KsNa6yPmLnhmTiSJ8Trwc9EBFZEMEK6anPZVbhpnYN7CY/yCg12OnJirPokZiGqzjTqQpMWqJExN67NrUOfligW4djItRVBWwvYVW/IXEu5klLEHpbcZamVjno/E0wUL4THwgTYXKJo2pbKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266553; c=relaxed/simple;
	bh=1Aul9o/qUilCj8W7iefEpcgzSu+rgeASpP39xJzntn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=id/TMbj+bM8DOJHVfYQvNaUi39ffDEd95jEk9dcbGkDX/piCoeqORkjQG4zbtdPdNZ1DTYohnaIb0An4QneI+iXlMaLifkKQU8rr+sfl99y7raTbKSCX0/I901QONrPI4wxsRYnVosaPoSH8//Xc8tec/qoVodJ/wcjRrtF/Yrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fzjEJjgp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4dd5f69e7so397483f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748266550; x=1748871350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Aul9o/qUilCj8W7iefEpcgzSu+rgeASpP39xJzntn8=;
        b=fzjEJjgpUfwgKBKy0pUYsfRVl43F/9y/4D3mVFsanD9Q+QxA59OlRMZ1kO/exJqyJC
         i/JMQ02N/oFZEwhTdBLRtUTQRHIMwAsOX0Jgdfr1r0/YHOFbHIhBXBKqShfp0Pu8JfAU
         9hOxfZTaR/Sd88sB06O69BAZo4grv4ZakPshtZxw1hkapAVIccRiKkeYmZJfsHW2m5ww
         gJ13YFYzn5zL/aqhFEOLsViY12rTsjZKuuKNQ3Svb1eGbpbevEYi4VDCK0+4hSwE7Adi
         g/DM+/16DqZQwU3DKDlTrF9kdRSZcOBzFn82D0qpVbsr/193DBMNmGVaPmKPETU81UuN
         0Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748266550; x=1748871350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Aul9o/qUilCj8W7iefEpcgzSu+rgeASpP39xJzntn8=;
        b=Gy/bNQKg80ML3O/AUDxR1DNhNA5aC/WN6qVhPim5KS8H6zwkckK0AQTy9N3M2qsrP6
         Phw5tAv2gZPTn4wqWSN6O5+gZQH0LVaaGH70PDptWRjDmqwa3IcEM92RvcsvAKYJGErL
         T7MIz+xOKatSgSqwvD2NeIo+7nhPenXJcnwonyTiGa9K4ZzIyntBxRlgW0M0CR5YzGgH
         8gM0iNrVQYr1ozsp4liAj85wyrx8uh6ftSe3JTkkioG09+RyMjqKcd2baQyg8OAZUHP9
         cqpK6a4f2u93fQrM/BUoYUC2mj5GywPUyDKshFxbK2EYLT74nshs36nme8GADNsSUhqa
         ZVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU39VEWxTteYaDIoNxsregqJ7P/fUt0zw9bHw3PD1KKjeIJlv6OR5S1Vpu2pZW79OjrHzJ3D3STCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+awwG04B001+YFda0SgU/F3fXK5tZ/U5Kgvw1nb2fHgZiaU7j
	IvusGTpjaopGuigqQCoppjDhoPAOdSh0A0sC7gAHIhRRj6iJk3ufBofxy95q7kufsDE=
X-Gm-Gg: ASbGncvpAtUd/YCxOXBPxFbpPKNCVIv+V1Sa2J+xJKI2R2RRyn5V9cdvS4n+k6Zx1sO
	q/aj8EgRX0+XzRcSHfJu7F5Ut7XD6hBUpm0J3wUrFT4wwgKYfPRtpEHevIRLuPoHk77fkK+4/R1
	8tpV7JR5uINbYtgxU5jPIuNrOyC9ZAWciTOuImhcHZu6jRDsUHiIbsxqfG1fSZz5Ab/t8VIX+Wg
	BTucvJS1agB6Bm6CS0qXI06L0biBWYOfjSelljfhLB5/zp7U/aIFJERpbQWL2s3Pugu3LxAbamw
	bR2ky2cFgqPOZBaOGmi1MTnpXGOCWWDuCdICNnaEZt4PZYGEZ19v8AzBKO6DWdf0
X-Google-Smtp-Source: AGHT+IH9z+RmjKbKlugE59RcSaIQ+1M7ULOdQMV8GitsPIwHN1Wg9MPj97qR1ijZaSygllLPsUw4Bw==
X-Received: by 2002:a05:6000:40df:b0:3a4:d18b:736f with SMTP id ffacd0b85a97d-3a4d18b753fmr5067346f8f.56.1748266549895;
        Mon, 26 May 2025 06:35:49 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99edsm235481665e9.36.2025.05.26.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 06:35:49 -0700 (PDT)
Date: Mon, 26 May 2025 15:35:47 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Chen Yu <yu.c.chen@intel.com>, peterz@infradead.org, 
	akpm@linux-foundation.org, mingo@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	corbet@lwn.net, mgorman@suse.de, mhocko@kernel.org, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, tim.c.chen@intel.com, aubrey.li@intel.com, libo.chen@oracle.com, 
	kprateek.nayak@amd.com, vineethr@linux.ibm.com, venkat88@linux.ibm.com, ayushjai@amd.com, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yu.chen.surf@foxmail.com
Subject: Re: [PATCH v5 2/2] sched/numa: add statistics of numa balance task
Message-ID: <uuhyie7udxyvbdpccwi7dl5cy26ygkkuxjixpl247u5nqwpcqm@5whxlt5ddswo>
References: <cover.1748002400.git.yu.c.chen@intel.com>
 <7ef90a88602ed536be46eba7152ed0d33bad5790.1748002400.git.yu.c.chen@intel.com>
 <cx4s4pnw5ymr4bxxmvrkhc457krq46eh6zamlr4ikp7tn3jsno@xzchjlnnawe5>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pba5ial65ghy3cht"
Content-Disposition: inline
In-Reply-To: <cx4s4pnw5ymr4bxxmvrkhc457krq46eh6zamlr4ikp7tn3jsno@xzchjlnnawe5>


--pba5ial65ghy3cht
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/2] sched/numa: add statistics of numa balance task
MIME-Version: 1.0

On Fri, May 23, 2025 at 04:42:50PM -0700, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> Hmm these are scheduler events, how are these relevant to memory cgroup
> or vmstat? Any reason to not expose these in cpu.stat?

Good point. If I take it further -- this functionality needs neither
memory controller (CONFIG_MEMCG) nor CPU controller
(CONFIG_CGROUP_SCHED), so it might be technically calculated and exposed
in _any_ cgroup (which would be same technical solution how cpu time is
counted in cpu.stat regardless of CPU controller, cpu_stat_show()).

Michal

--pba5ial65ghy3cht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDRuMQAKCRAt3Wney77B
SW8BAP4t+Hvi0LKP9OmSUAPwS3bA8QPQUvrZoDQmC08aYtF5/gD/dmVgrB6xQ1yK
HAuRq6/nLpVwAY1doEUJs9ch7iqtfQk=
=/lHO
-----END PGP SIGNATURE-----

--pba5ial65ghy3cht--

