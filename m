Return-Path: <linux-doc+bounces-44107-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BE1A99996
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 22:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133BE1897D88
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 20:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AF81ACED5;
	Wed, 23 Apr 2025 20:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b="ejMPrnTa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A8D26B953
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441068; cv=none; b=Rd6d4vVB1CUcPoSGu7dLMKgLX3ZCx9WbQQOHcFOvfUg0b/5c+gT6vX4ulik2ufJpIbHJNoM5e+6bB6ekRKl5D2pC9rs1hDLYfXHtpEKcp+b3ZnoxVBL7vjn+ZwpGO/AUkd0R1H34gtW9CgjdfpPgv1YvIZ5nkycSFK1QLk4rGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441068; c=relaxed/simple;
	bh=TvUkSxxybZ2cwhtqLnLFuZdwyJGsgWIKXYt6FFHoPGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjTpWjLbwpzPdHZmXnNuInFS33R4PD8g8nd0Re3VTjEUVGkJ4gkhHqlzaLJWNA+Eo45dT8vbTLNKL1JQmbEoTcsEtZz0zwmU0t+QVBJbaUejIzEavMOOEv9qTa/0q/yzsol5bLNwRMr58PaQdzTeXnNkOjkUbTBltvnr/SKINz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com; spf=pass smtp.mailfrom=clever-cloud.com; dkim=pass (2048-bit key) header.d=clever-cloud.com header.i=@clever-cloud.com header.b=ejMPrnTa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clever-cloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clever-cloud.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso172167f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clever-cloud.com; s=google; t=1745441064; x=1746045864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4JQukv4V2SGT25PhTUE5gzgD7+TW+jjgBfY+fBa4EE=;
        b=ejMPrnTaSdESdO2Y6uTkPDunWKGiWV6KHcqTiWjfC5Th9kQYjioTM2HE0Kq2sDUzQx
         o6Fz4nUH0EC4NsEmuBHgIcWPRE/rAQmmUDHOq9Z7vJ0eOP1GrDHrtgyWi0knToz4QbYd
         s3uCBoFdmgmzeZLxFqQ5rACcXsld79mwYBB5Dq0dNrtqzgOnVWR2yMHJGybx4yG7DnU1
         hd8/OP8xpNv97TumauM1VARxGBakTITAlcGR5NbAVbr+Twy2jU+j+U4Ne1FhFL0cDXZY
         UQn1tYQPi5+fVkN5BDf7vjlzPeLKMJVZ7GzYZCWs13TXhepFsEeOEqty9FO4nGt7qsUi
         wiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441064; x=1746045864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4JQukv4V2SGT25PhTUE5gzgD7+TW+jjgBfY+fBa4EE=;
        b=q2KazVzACqbJ/YNJ+o/R7uWoMOywqBZ1eKd7py1khR9COpOhBGoQNaIZ5IXA5ZufI+
         W0AdPD+284iEh+1VYsfSmMougRUqv+cfoMSlqVdkWBsG7iO0P8+eHNEoZ1qWUIdCuEn6
         vHhUR82ESMynfDyT8rkzNEhgw6e+Qcj1v4/7ZPDw2F/POa/RwBYCKnQCsdvnYU/4Yoz9
         7dzec0vJ8oBA/4nVPib2nPvTF2ZN83dVpUXZKxe8dxVB3ZiNzIrij7VgUVP8MoCLPjB8
         wX7I4+EtowhB+w2k5xpDImH8RTD9QWnDvFzvuUmX/uSZnb+vvQ69qqfeDggsbl7F4XO9
         KJkg==
X-Forwarded-Encrypted: i=1; AJvYcCXB6PGg8/1eOX2SMXbWn8dhg7VT+nAwnUCwzci9hXJCLdV2fZGbbxdFdwOUp+czDQ9wtZ/u3UGBfIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsph8ZbSkTpywutg3OHl6idGIjqir7DwV/lsxzyrTI31khfnw3
	ilz8w4ob4ADCyMmyaOdeTTBUwjUjdij7Bz9BNCY7fXU/RTIxsoOEb/ARC99+eZM=
X-Gm-Gg: ASbGnctOFoTiu80P6CAKSCw9LAMEavGuG/A4Xbodinj0M6OdSuSpVlQtw6lN84HueBI
	RR436CH9GBC9z4r/FxKlMcTSatkRbl0uP2qQOtJS+NDOidC9rfjIzMFzYFWS7SUh4K0PT9irDBM
	DyOLgKXe84eMnWMHqHnUBuxreA+0Ee3piNtwajn5IuWXEWNjErbT3o1q+MaDLg55Y9/eQAZECOO
	m8ei+PP76HZAi2rJj54nwQ4Qq2JHsJtK6I5726FpnmsvYkG4B5q9MwKauBAJg63iGOscUAugyGX
	8S3u2KQpZB9gYT15tKEIpryJRR7xK1AZk3FMTTDit5wDN59EB6Z6D569
X-Google-Smtp-Source: AGHT+IHrt2OWKJypr1o1ICBn+gRGjQNOGrIDNNGpq6ACRGf8v97G9orsWa/cY0oOdwaup9byy966mA==
X-Received: by 2002:a5d:64a5:0:b0:391:253b:4046 with SMTP id ffacd0b85a97d-39efba45fedmr16053022f8f.16.1745441064448;
        Wed, 23 Apr 2025 13:44:24 -0700 (PDT)
Received: from exherswag ([2a01:e34:ec5f:fb40:df48:ecab:7887:deaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c0fsm19841706f8f.88.2025.04.23.13.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 13:44:23 -0700 (PDT)
Date: Wed, 23 Apr 2025 22:44:22 +0200
From: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v8 2/7] crash_dump: make dm crypt keys persist for the
 kdump kernel
Message-ID: <q3l724gslm3kzljjdo42l5murdw4pclpnmmtzu5jvqv4gwyxma@ek4jucbut32i>
References: <20250207080818.129165-1-coxu@redhat.com>
 <20250207080818.129165-3-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250207080818.129165-3-coxu@redhat.com>

On Fri, Feb 07, 2025 at 04:08:10PM +0800, Coiby Xu wrote:
>+config CRASH_DM_CRYPT
>+	bool "Support saving crash dump to dm-crypt encrypted volume"
>+	depends on KEXEC_FILE
>+	depends on CRASH_DUMP
>+	depends on DM_CRYPT
>+	help
>+	  With this option enabled, user space can intereact with
>+	  /sys/kernel/config/crash_dm_crypt_keys to make the dm crypt keys
>+	  persistent for the dump-capture kernel.
>+

Maybe also add CONFIG_CONFIGFS_FS option? Without it this series code doesn't compile:

Last build lines:

    GEN     modules.builtin
    MODPOST vmlinux.symvers
    UPD     include/generated/utsversion.h
    CC      init/version-timestamp.o
    KSYMS   .tmp_vmlinux0.kallsyms.S
    AS      .tmp_vmlinux0.kallsyms.o
    LD      .tmp_vmlinux1
  ld: vmlinux.o: in function `config_keys_make_item':
  /usr/src/linux/kernel/crash_dump_dm_crypt.c:250:(.text+0x228028): undefined reference to `config_item_init_type_name'
  ld: vmlinux.o: in function `configfs_dmcrypt_keys_init':
  /usr/src/linux/kernel/crash_dump_dm_crypt.c:442:(.init.text+0x71e5c): undefined reference to `config_group_init'
  ld: /usr/src/linux/kernel/crash_dump_dm_crypt.c:444:(.init.text+0x71e82): undefined reference to `configfs_register_subsystem'
  ld: /usr/src/linux/kernel/crash_dump_dm_crypt.c:454:(.init.text+0x71ef7): undefined reference to `configfs_unregister_subsystem'
  make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
  make[1]: *** [/usr/src/linux/Makefile:1226: vmlinux] Error 2
  make: *** [Makefile:251: __sub-make] Error 2


