Return-Path: <linux-doc+bounces-8577-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D884CAEB
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 13:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A95A1C2442B
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 12:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CA08BFB;
	Wed,  7 Feb 2024 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fXZiuR/C"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A170524208
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 12:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707310418; cv=none; b=RvLVfR6sZmBG4KdgPoXB4glI6NPR85xR01pMZjeNRiI4A8xiaufjq0PyU2TotA1NwKl//mVRIpM8LbIwLfgM61DvT585mmY+6bjut1Fn74yRjbqwAw/GVXkfBhtBsRt73jaueaZlXWrwcVMLQYMHYMIzq0yznqBmzt5d4Yff+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707310418; c=relaxed/simple;
	bh=PpFdo+JQ4Mg2lCqCBdp2fgoJ+UQ+NLh6Fris2Zvw1KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNexHRO4qW3MzHvNaDNPb7Lz3mp/X+M0x1HYVkXRP1kzc0rZiK7JAwxPxBg9lizxHISJbdCNx7h1nlipcHcczMmMVhSZcWiMM8E0L31lYdFM7Nfypiw1k9mHtnqPGoyX7230OcwEU3liz/tItiIv/NBg5UFW1e9PT7CjlSVGX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fXZiuR/C; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d71cb97937so6063805ad.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Feb 2024 04:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707310416; x=1707915216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/FWqIrHK3r1+5/LGbrU0IvWdDfD0vfJmA+DhAX2wzg=;
        b=fXZiuR/CdrH2FZZv/oES9AxZgcqaJ9D8YxUyJgwA1F3L+3xLLRyf2SPrNef45Z4c+3
         MzXQmDsFR8zVvT5tfszd1HZvPOvpXXECsIu3KXU6Uj8k9AvmxF3cCwYCg0cuCuRacPR0
         L6WUfuXPC3R5ak64U9uQRVsFcCO6fKD3xbtdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707310416; x=1707915216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/FWqIrHK3r1+5/LGbrU0IvWdDfD0vfJmA+DhAX2wzg=;
        b=F2K2E6D7LKCMyy73VHO/C4p00TsisiAG3hGOdRQCavYXjiq7lKLzi4bJR2hGYup6y/
         TtCN0Iw5z9KdInNFzLs+ziZ72FpiyBLsXDoJizSYaKzkRXnMGVN0vK9wEBuAo4xJhs/p
         A0qKDyxlytEZZkS00+YaVIDX5IxoJT9sm5mNLzVEjvvLASy2GgtUbGokwJI6CLRWNVe4
         QUnHYcSAnHQ0hNXtD7uwqqW8W5TbV2qOJWbN8tMAToi3yOX/Msx/8OSGxRTd7UU77JSm
         kIFaXoa5OZp/RMyiZS1ow2bWLLMtkyaHriTfW11qImB0iKOqCEnhiy7x0Qq1i6bFGzWS
         /XGg==
X-Forwarded-Encrypted: i=1; AJvYcCXAGnK69jVlXjx+c1qz32PV+1Mu9BcW2oA8dsyxnvcJlOzkHaHcSwZi1a1J6pXt3bZ57xIH1S1hC6bHsma3AQ6eNY7eex/HkmzK
X-Gm-Message-State: AOJu0YxczfsfJw2eO9a+nT1RMEsK9//YZfe5F+hPkifTFPEB89O+/bKt
	xmKgfoFG3zLOFsaATKMF15LVWLqOW8BAm9HpwvSeUkV3WumbsPUUNU0Q5XavjQ==
X-Google-Smtp-Source: AGHT+IGDL5lqBvKqPmrTE6QBi9/tJBFm3Dbc94jiRAgzlfFbsjwtdpIVyjgBrLUpDwx1tabVhsWTeg==
X-Received: by 2002:a17:902:6f16:b0:1d9:cc00:5240 with SMTP id w22-20020a1709026f1600b001d9cc005240mr4301862plk.39.1707310416018;
        Wed, 07 Feb 2024 04:53:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVP2ws9DL0Nxv4lmGdm4q3o+K6PHJn06UiQrAnF9y/jM+zCfnIvZarhXt272aqoJjpK0E6jxXskcYeao+KvkE9zehS+7rfcGP2LcgAwetASVe3PqJa4vER5riMPWR2wYRxGOOl0yq5tVSTphkblxj6a6QQYAN9V/9cjxJI/2DAIRHQEDSh+QLJP3MDtGbIbAJ+AUwDClh3veiJpDrkk8GF7nl7wW4DbDf8mS/caRdH5IxcQn4BDH7H7Yrr0QkGHU0noErmIYVmXusj5hraLwZSw1sNrkMdno2bZpmctNkGaIcTAD0PdpQHW+wvXHXDrd7yYqQrt6Ut6HZj/
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001d9daf742ccsm1337181plg.233.2024.02.07.04.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:53:35 -0800 (PST)
Date: Wed, 7 Feb 2024 04:53:35 -0800
From: Kees Cook <keescook@chromium.org>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: tony.luck@intel.com, gpiccoli@igalia.com, shuah@kernel.org,
	corbet@lwn.net, xlpang@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/testing: adjust pstore backend related selftest
Message-ID: <202402070452.24B3200@keescook>
References: <20240207021921.206425-1-xiangzao@linux.alibaba.com>
 <20240207021921.206425-4-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207021921.206425-4-xiangzao@linux.alibaba.com>

On Wed, Feb 07, 2024 at 10:19:21AM +0800, Yuanhe Shu wrote:
> Pstore now supports multiple backends, the module parameter
> pstore.backend varies from 'registered backend' to 'backends that are
> allowed to register'. Adjust selftests to match the change.
> 
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> ---
>  tools/testing/selftests/pstore/common_tests   |  8 +--
>  .../selftests/pstore/pstore_post_reboot_tests | 65 ++++++++++---------
>  tools/testing/selftests/pstore/pstore_tests   |  2 +-
>  3 files changed, 38 insertions(+), 37 deletions(-)
> 
> diff --git a/tools/testing/selftests/pstore/common_tests b/tools/testing/selftests/pstore/common_tests
> index 4509f0cc9c91..497e6fc3215f 100755
> --- a/tools/testing/selftests/pstore/common_tests
> +++ b/tools/testing/selftests/pstore/common_tests
> @@ -27,9 +27,9 @@ show_result() { # result_value
>  }
>  
>  check_files_exist() { # type of pstorefs file
> -    if [ -e ${1}-${backend}-0 ]; then
> +    if [ -e ${1}-${2}-0 ]; then
>  	prlog "ok"
> -	for f in `ls ${1}-${backend}-*`; do
> +	for f in `ls ${1}-${2}-*`; do
>              prlog -e "\t${f}"
>  	done
>      else
> @@ -74,9 +74,9 @@ prlog "=== Pstore unit tests (`basename $0`) ==="
>  prlog "UUID="$UUID
>  
>  prlog -n "Checking pstore backend is registered ... "
> -backend=`cat /sys/module/pstore/parameters/backend`
> +backends=$(dmesg | sed -n 's/.*pstore: Registered \(.*\) as persistent store backend.*/\1/p')
>  show_result $?
> -prlog -e "\tbackend=${backend}"
> +prlog -e "\tbackends="$backends

Missing trailing "? Also, doesn't this end up printing multiple lines?
Perhaps, like LSM stacking, we need a /sys/module entry for the list of
backends, comma separated?

>  prlog -e "\tcmdline=`cat /proc/cmdline`"
>  if [ $rc -ne 0 ]; then
>      exit 1
> diff --git a/tools/testing/selftests/pstore/pstore_post_reboot_tests b/tools/testing/selftests/pstore/pstore_post_reboot_tests
> index d6da5e86efbf..9e40ccb9c918 100755
> --- a/tools/testing/selftests/pstore/pstore_post_reboot_tests
> +++ b/tools/testing/selftests/pstore/pstore_post_reboot_tests
> @@ -36,45 +36,46 @@ else
>  fi
>  
>  cd ${mount_point}
> +for backend in ${backends}; do
> +    prlog -n "Checking ${backend}-dmesg files exist in pstore filesystem ... "
> +    check_files_exist dmesg ${backend}
>  
> -prlog -n "Checking dmesg files exist in pstore filesystem ... "
> -check_files_exist dmesg
> +    prlog -n "Checking ${backend}-console files exist in pstore filesystem ... "
> +    check_files_exist console ${backend}
>  
> -prlog -n "Checking console files exist in pstore filesystem ... "
> -check_files_exist console
> +    prlog -n "Checking ${backend}-pmsg files exist in pstore filesystem ... "
> +    check_files_exist pmsg ${backend}
>  
> -prlog -n "Checking pmsg files exist in pstore filesystem ... "
> -check_files_exist pmsg
> +    prlog -n "Checking ${backend}-dmesg files contain oops end marker"
> +    grep_end_trace() {
> +        grep -q "\---\[ end trace" $1
> +    }
> +    files=`ls dmesg-${backend}-*`
> +    operate_files $? "$files" grep_end_trace
>  
> -prlog -n "Checking dmesg files contain oops end marker"
> -grep_end_trace() {
> -    grep -q "\---\[ end trace" $1
> -}
> -files=`ls dmesg-${backend}-*`
> -operate_files $? "$files" grep_end_trace
> +    prlog -n "Checking ${backend}-console file contains oops end marker ... "
> +    grep -q "\---\[ end trace" console-${backend}-0
> +    show_result $?
>  
> -prlog -n "Checking console file contains oops end marker ... "
> -grep -q "\---\[ end trace" console-${backend}-0
> -show_result $?
> -
> -prlog -n "Checking pmsg file properly keeps the content written before crash ... "
> -prev_uuid=`cat $TOP_DIR/prev_uuid`
> -if [ $? -eq 0 ]; then
> -    nr_matched=`grep -c "$TEST_STRING_PATTERN" pmsg-${backend}-0`
> -    if [ $nr_matched -eq 1 ]; then
> -	grep -q "$TEST_STRING_PATTERN"$prev_uuid pmsg-${backend}-0
> -	show_result $?
> +    prlog -n "Checking ${backend}-pmsg file properly keeps the content written before crash ... "
> +    prev_uuid=`cat $TOP_DIR/prev_uuid`
> +    if [ $? -eq 0 ]; then
> +        nr_matched=`grep -c "$TEST_STRING_PATTERN" pmsg-${backend}-0`
> +        if [ $nr_matched -eq 1 ]; then
> +	    grep -q "$TEST_STRING_PATTERN"$prev_uuid pmsg-${backend}-0
> +	    show_result $?
> +        else
> +            prlog "FAIL"
> +            rc=1
> +        fi
>      else
> -	prlog "FAIL"
> -	rc=1
> +        prlog "FAIL"
> +        rc=1
>      fi
> -else
> -    prlog "FAIL"
> -    rc=1
> -fi
>  
> -prlog -n "Removing all files in pstore filesystem "
> -files=`ls *-${backend}-*`
> -operate_files $? "$files" rm
> +    prlog -n "Removing all ${backend} files in pstore filesystem "
> +    files=`ls *-${backend}-*`
> +    operate_files $? "$files" rm
> +done
>  
>  exit $rc
> diff --git a/tools/testing/selftests/pstore/pstore_tests b/tools/testing/selftests/pstore/pstore_tests
> index 2aa9a3852a84..f4665a8c77dc 100755
> --- a/tools/testing/selftests/pstore/pstore_tests
> +++ b/tools/testing/selftests/pstore/pstore_tests
> @@ -10,7 +10,7 @@
>  . ./common_tests
>  
>  prlog -n "Checking pstore console is registered ... "
> -dmesg | grep -Eq "console \[(pstore|${backend})"
> +dmesg | grep -Eq "console \[(pstore console)"
>  show_result $?
>  
>  prlog -n "Checking /dev/pmsg0 exists ... "
> -- 
> 2.39.3
> 

Otherwise seems ok

-- 
Kees Cook

