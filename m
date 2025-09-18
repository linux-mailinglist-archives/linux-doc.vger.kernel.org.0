Return-Path: <linux-doc+bounces-56591-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1EB2A3E5
	for <lists+linux-doc@lfdr.de>; Mon, 18 Aug 2025 15:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B002956576E
	for <lists+linux-doc@lfdr.de>; Mon, 18 Aug 2025 13:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E0731B13B;
	Mon, 18 Aug 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ve8s/cxv"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2031CA5B
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522368; cv=none; b=hwC6sJcik7FhOtg9jbZwlzMT7DzxtA2a29jYLaY/0NW4qNvqLjJT4KP9NFsEip204eLp0QZzBekrj+dwhQDAuFqiAoEGY0yogkJOhkBbwcMJteym061377vdLo0LHetK34k2vr4zXtFGwFMO2vN5annEWPeJ4u7/zr4MBLPo7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522368; c=relaxed/simple;
	bh=I8ViiZqjxg75RYvEGN4uC+Kfgg9/jGCWinkUUrtlh3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orMrah8GoWauxqZCzJUymAOh0quHEcNfT54pTbSZLpP5RoeAgvtpaNG3ubjd/9XeXMruAbtfIEmwMJsOYIvahTMzYtk2v60l7vZrWY5TaQ/t9/Jd/jhaUlTHzSbxJ2/UNkJLQDry2XJ4oFJYZglajr+H+MkMz2X+jizHS+1wOJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ve8s/cxv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755522366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6lWFVTHNTqihw285zTjFaouowYhqDI1uhwlP3YPVfSU=;
	b=Ve8s/cxvu/g4HgqFaDkiFZziDn+/DnfntKFogBMXOHtUkys7J4iak4PL+YX1DpbWpYZ9eT
	XMswz6Hj2FqsesUvPME4FtHn4yNMIpxjBr3sSwfGq472zQleXDeBgI18aw6MJd5K9YSpW0
	ZLn5xpSrL7FzphwLisUQVTFZ96iJ40k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-7pijqTLSPFODgaqV6DUjkg-1; Mon, 18 Aug 2025 09:06:04 -0400
X-MC-Unique: 7pijqTLSPFODgaqV6DUjkg-1
X-Mimecast-MFC-AGG-ID: 7pijqTLSPFODgaqV6DUjkg_1755522363
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so25168775e9.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 06:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755522363; x=1756127163;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lWFVTHNTqihw285zTjFaouowYhqDI1uhwlP3YPVfSU=;
        b=l3EA+CtDDrkHacTvoqN1/ul9hW3HEJ6OgXxrl2bX4fgnd8qnBoCrRSLaUkMJsDLmCY
         7fvTuJQO4f08JWkFAcrifZU1XNGy8olkvoIloJW5nsWcyneZdvO42n766mUBKxtGZHJY
         zY7p477WJY6fiHFH0uwDIEOPqxeORnr/0wm5kzIPY9URHwd59GdOM64L+LcxcyVmKKLY
         EjJe7CZpzjymSkDwOxRjJoCw7Tv89+KGqRY7oUhJhhtut1le2MfDvK6MGwqESvuTNp74
         lLL84HnAFW+XoGJgVp1aZIadOo7k6hV37Qw8oeh6m9OSFUEVHWD2WcZFbMWLIliKQrpj
         KaEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVEY7fjH84UGvChJJy37HsYyNqTM9ecTrZlTXT9kcIBldbws2ehSsAQBRWIF3AV6S46QQmfXvFfmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDo9bdPHCI5AC52U9dLvhtCQnkgFHnxvFHh9r/YwNYfuwRXYyG
	wyJmKHrVKyIZl2DFYCsCGtMEHQUdPfGIJ1O8kIFdjXPRczakY2Kx2gqemBP6CnmYh+cXceMfdtb
	OOOveHrUl5NQimOpNvwTPx4gmo41hoD/xpD0ATIJ01dOMR4S9I6x1SsVqlLpRMQ==
X-Gm-Gg: ASbGncvfpZhNEButexPbhzT25FXGdQ123QlxH1rTUw4pYoPd0M5QMrfHMbKH5KpRQA1
	YJ77XFCY6t2Jdic2Ae5/8kraF4y4qDMt/OqekMOVOiSFmcWVK7B3KrOE2tTG0JDyz3aMUG71kzG
	3v7NPQ8B4wYBKW/snT0a3pzHAnjWG0keHgXcoTMw1y2RXuXjUAmrutomrS6rJZYmqErKdCwTYjP
	OgY7Wfw+vxC0mnnZfOO/j7+wQQoTMc0Ru9tBO/1MBn1kWF3NvqkvP3SoEPPbt6Zbm2WNQRO+6we
	7p0NwztqGFUnMh/HiCdMD4zDVfEF/5JaGzx2jpbT4y5r4GiRc8CiVg8PcQJlGexueX3dPvGVC0z
	fiwtUf7D30rhucTxbrpIUk+F7Elr/W+831e1B7U5hxTIDHTaLcf7OkFssGrvSTESM
X-Received: by 2002:a05:6000:2586:b0:3b5:e6bf:f86b with SMTP id ffacd0b85a97d-3ba5068102amr13511054f8f.11.1755522363118;
        Mon, 18 Aug 2025 06:06:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfrgsoT1TOVtpG1c/AniLc8bVaw+tyzrLAfe8E6BPoy9cmQkiw4CgNBczPzw9LaWx4sWZxUg==
X-Received: by 2002:a05:6000:2586:b0:3b5:e6bf:f86b with SMTP id ffacd0b85a97d-3ba5068102amr13511006f8f.11.1755522362594;
        Mon, 18 Aug 2025 06:06:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:600:53c7:df43:7dc3:ae39? (p200300d82f22060053c7df437dc3ae39.dip0.t-ipconnect.de. [2003:d8:2f22:600:53c7:df43:7dc3:ae39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758690sm12914199f8f.6.2025.08.18.06.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:06:02 -0700 (PDT)
Message-ID: <cdd753ab-61b7-48ac-b535-556f39f46b81@redhat.com>
Date: Mon, 18 Aug 2025 15:06:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] selftests: prctl: introduce tests for disabling
 THPs except for madvise
To: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org, corbet@lwn.net, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, baohua@kernel.org,
 shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com,
 laoar.shao@gmail.com, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, vbabka@suse.cz, jannh@google.com,
 Arnd Bergmann <arnd@arndb.de>, sj@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250815135549.130506-1-usamaarif642@gmail.com>
 <20250815135549.130506-8-usamaarif642@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250815135549.130506-8-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.08.25 15:54, Usama Arif wrote:
> The test will set the global system THP setting to never, madvise
> or always depending on the fixture variant and the 2M setting to
> inherit before it starts (and reset to original at teardown).
> The fixture setup will also test if PR_SET_THP_DISABLE prctl call can
> be made with PR_THP_DISABLE_EXCEPT_ADVISED and skip if it fails.
> 
> This tests if the process can:
> - successfully get the policy to disable THPs expect for madvise.
> - get hugepages only on MADV_HUGE and MADV_COLLAPSE if the global policy
>    is madvise/always and only with MADV_COLLAPSE if the global policy is
>    never.
> - successfully reset the policy of the process.
> - after reset, only get hugepages with:
>    - MADV_COLLAPSE when policy is set to never.
>    - MADV_HUGE and MADV_COLLAPSE when policy is set to madvise.
>    - always when policy is set to "always".
> - never get a THP with MADV_NOHUGEPAGE.
> - repeat the above tests in a forked process to make sure  the policy is
>    carried across forks.
> 
> Test results:
> ./prctl_thp_disable
> TAP version 13
> 1..12
> ok 1 prctl_thp_disable_completely.never.nofork
> ok 2 prctl_thp_disable_completely.never.fork
> ok 3 prctl_thp_disable_completely.madvise.nofork
> ok 4 prctl_thp_disable_completely.madvise.fork
> ok 5 prctl_thp_disable_completely.always.nofork
> ok 6 prctl_thp_disable_completely.always.fork
> ok 7 prctl_thp_disable_except_madvise.never.nofork
> ok 8 prctl_thp_disable_except_madvise.never.fork
> ok 9 prctl_thp_disable_except_madvise.madvise.nofork
> ok 10 prctl_thp_disable_except_madvise.madvise.fork
> ok 11 prctl_thp_disable_except_madvise.always.nofork
> ok 12 prctl_thp_disable_except_madvise.always.fork
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


