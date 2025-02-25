Return-Path: <linux-doc+bounces-39413-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DAA448F4
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 18:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68F091885DB6
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 17:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FE919340B;
	Tue, 25 Feb 2025 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nt80qRTs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA5198A19
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740505949; cv=none; b=lbzs3tiR9VCdVZjewGEYsBzHxJITSfwSBCFq77NWkdFIaJ+ZpKdwxZ9n2Gwfc6tGT/+SzZJ0IS/PxbzG2plhn9ubpZzXJw6WkUc3V3fUDM49zt0ML5Tn4NmCM4WzOE4RZezwy71+lsAd9Z7wC0qK045juJLq6agjA0Ugu+LiJlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740505949; c=relaxed/simple;
	bh=TITnbcgolKPMPksTb0kVckLbIOLQEkwI2FcyCceIkT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDw0pqf+ekXr2rJxIvDKeTecFdrPzpQ4Ft4KU+419t8OgCY3akQkcExMTDjKF0cpxGmjfolbGafQ6IZwxUC4Ez0cv9j10oVbgD86zKWYKf/k0oOy//r+7W+9lxr+jjG0K9OmW2hE82CuBwTuaco05XkrrVkIyRPOXhUmmt9KKlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nt80qRTs; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-221ac1f849fso1825ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 09:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740505948; x=1741110748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dN8nBA+Qh6D4N+wqpSDyJLyiHWYbmS4OUKXh0N+DSqI=;
        b=Nt80qRTsdIMKwK77eOr5LzLlJ6jv6oZ1XHDd6JlCzx539zK4aJJyWsue9Zgfdk2bNZ
         /hGVuCPln+75Wikzcy+h5VjgkFl6JnaCzXw5kkA/bWco+Pr8zsaL1TRrP8Vs26Kwt2Uf
         ZCh3SNk3gj/QHBWnV32g7+9XZLcqSbOvlMlSiwfDQcP4j5+/8mZuHlgdhtGZVbosLN4b
         YijJmCwdSeGE1PM9npYMVeeXv18y+YSX7Cxpc1iFn/2RWwp5+0JvQI4+EtO6k1uSmWtT
         /nkdvxmIEiqivOK5B+R5cf5yNBCHijxkPzGB7A62mx4+/f+Lf8l0TCMRqHL3+Z86IkCL
         QBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740505948; x=1741110748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN8nBA+Qh6D4N+wqpSDyJLyiHWYbmS4OUKXh0N+DSqI=;
        b=jCpo3mJChmoxAp7Sa939pLmnzclHwf8cYtuTi5ZMWRbEXOFra7aFTpW8r8AJPdIM2F
         6YVNvd0BPVT8+GRZLSN8yNdoCVhXE/4Jx8+jUaUj96Yjd40Xb0sYGzoE4fInQI9EF1Nu
         rKlUGwjhj8Gp9ofoBQa0BADlwS+ihAxi5Uqoe5P6kcZLlgga8+eTAhwNx89u2F6+rYev
         ati4FOGdjJx7g2Ba3WOB0jEHKSO1nrnCqHW4tmzLR5efaK8D04XI8P9VTWxZHkbtNRFv
         nyvZzYQSh/k1wHs+sxdvdqtmqhkjJaZckPcg4aGKxQDstSJmPrEe5d+pquBSd6ZOkLXl
         UF1w==
X-Forwarded-Encrypted: i=1; AJvYcCVZr6wIwtkZyrWUCt3xz8D8OlNIQl+QMPaMIj0R2zddkN67AmU4duPM0xkDNkbxx9MNb1SL0e2nEls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQjWJnwvbyWMd4HGUuj6AB/HC0gEZ1zgNWblQoTvz42znkob2
	Np9D8b768fZ2V3ivGoCJAu5s2AhkZ6tJA74I29Km/teo0AuS4pzL+7uQFHlpVA==
X-Gm-Gg: ASbGncvKjACsCysVoAu+pebwF9eI+nnA6Eo+w9zyvSv8vc8/coz6IXAfu3r64qgKXbi
	islUPywqTVD9v7sdztqsW5wra9ealESDOr6Vy5uum3R6e2Vu6UbqaG6zeH2WSZw02UCAIsvCyoQ
	DqkqwXP5A+iLfiaJYyoptufOIgea3suqX+aZba+fMmsMTHwKzJgwUUTtkHGuzs97PlVFVv3TtTW
	8asXkUOVDGVXtBNalA+rk4zvV/07zX2VwH/Iq/dznvt7PK9RW1N9An5i8b3b53dQSuA9VxASoBw
	yuWMl60MUhLqyEG/j3RwXxWLxBhyXYUQ+gnNs9WFogEbLW4BllSgTaXmFzHeVDA=
X-Google-Smtp-Source: AGHT+IHCwCn1SF2NMONCzfAyHzGrJNS1HAUTJPist+TAdk8bMDyf0wMytHFuTMKOTPJoVoDGnbqb0g==
X-Received: by 2002:a17:903:244d:b0:216:48d4:b3a8 with SMTP id d9443c01a7336-22307a60187mr3928025ad.16.1740505947317;
        Tue, 25 Feb 2025 09:52:27 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a43ccb3sm1861445a91.39.2025.02.25.09.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:52:26 -0800 (PST)
Date: Tue, 25 Feb 2025 17:52:16 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z74DUPcl9KRZcvpW@google.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>

On Tue, Feb 25, 2025 at 09:25:40AM -0800, Nicolin Chen wrote:
> Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> be the first use case. Since the vsid reader will be the eventq handler
> that already holds a streams_mutex, reuse that to fenche the vmaster too.
> 
> Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> or unset the master->vmaster point. Put these helpers inside the existing
> arm_smmu_attach_prepare/commit().
> 
> For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 28 ++++++++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 45 +++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 18 +++++++-
>  3 files changed, 90 insertions(+), 1 deletion(-)
> 

Apologies for my spelling error in [1]. It's supposed to be:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

For all the other patches too. Correct spelling in [2].

Thanks,
Praan

[1] https://lore.kernel.org/all/Z73zvIbsXzJMCaNt@google.com/
[2] https://lore.kernel.org/all/Z730M3XptvDRObBp@google.com/ 


