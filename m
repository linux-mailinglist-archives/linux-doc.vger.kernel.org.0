Return-Path: <linux-doc+bounces-22703-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE695018F
	for <lists+linux-doc@lfdr.de>; Tue, 13 Aug 2024 11:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37983B27D99
	for <lists+linux-doc@lfdr.de>; Tue, 13 Aug 2024 09:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EC6189918;
	Tue, 13 Aug 2024 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="frB6TVfL"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B034187554
	for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723542634; cv=none; b=B2SToA5DUQcefDuRgqbvF9NYEFDslP0WNb51Mf129XSMJI/FI7yPFU4VvkmAGyVrZv+y0EOzyERNwyWld9kFnlcgw+1e4EACEh6saYxTovSYvNjgeLO2jRKwBhgC0tRI2sSE8NVVpk6OoNdLBt2bGodlx96SbQwgxH7O2TEyd5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723542634; c=relaxed/simple;
	bh=hIJoAWutxisu2c1iykoljPuEC7jmnbHB3Xe5ZIAuKkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rA1HEtYA9Jif6aTlUCAyaUs7Xeo7HtpfvdOHdR3Xp3OYu3e1M23xX9l/Od6FfzexgFCUfPQj0FQTkmxyztyZ/tmu+5XU/eaHNZsafL2BQLo6kkbFTv+5jDmkWn1Oju7qQP/LtcSZQVF5ptrOGtzMXRPszZjUy6Sj4wgAuAdo/ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=frB6TVfL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723542632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=clbh4fn97Z6K9oM4HMkP7echc3WF2vV5h61IVEEYVKg=;
	b=frB6TVfLEQic3qNLOQEBLuDEQAWSF/ywDNU2ZJvXqg6a23AEJw1MznUtfCXU6azQDTjfPu
	JAdItlbSfIuLo6Es/27zDRUfz86/iF+limAiZhE01ay4kaN6dT5PwAEvfTHVe4NZbkOM01
	a1hoERcsymMWnIvd3I/2BuT3cTniGn4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-ofc6adPIMtaLoNazuAGgPw-1; Tue, 13 Aug 2024 05:50:26 -0400
X-MC-Unique: ofc6adPIMtaLoNazuAGgPw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-427feed9c71so10192245e9.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 02:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723542625; x=1724147425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clbh4fn97Z6K9oM4HMkP7echc3WF2vV5h61IVEEYVKg=;
        b=oAQWWZNSGUC9Z1KKQVBcC7qEuD2RN6P1jipyD6hul7GV+Cfy+Ull0+saUNmGvFSnXb
         aL7rZhDdFr8dAqSjTa/3ctkvYyuAgn2n/aJUcqc3xqZPei7EZmCuwMObE7i0uQTrONAM
         ngRhV8XGW0NZO4zVkxOH1LSMMzc3jf3sF0fvKPhxj3RjFPLBKi9fMWAFp8wEM3/AB33Z
         PK1NjsOV2qJ4emPMhF1lAuyIOw8YlcyigQBeJwd1swWGcfXTLWN0yo0GVU6buekPjPXT
         f0yxYn+wGDJb/ZKv1Fjfh7mRMHEYdO5C4wCqIX0oGOo2SfZHmYgrQlSNMl8qg6xBPhPb
         plxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeG65gb78CIzLotvM4OCoWigxyDgeYVOyozLtIJh68wtz/TXIlqcgoFJSWPE8H+bBBd6jhFkQN858pSoWBokXYFe3Cj92TLkW3
X-Gm-Message-State: AOJu0Yzfx5ZCJ9X6uueAZ++XibPve70QRgpp6L+g30gH9GZjn2CVUTqT
	20My1gDF3K5+5G2wTAR6WlRfK7SgGiwwpDXUu/DPt8WlrEWIMn08zqUJ5zyu/IB/vnD//zPld86
	uziMHw8MuiyfEGFwdIQ2aMx1aaaeGtLhngRlhm0X4tfTqZVZg6MUNosiBXg==
X-Received: by 2002:a05:600c:4f07:b0:426:6ea6:383d with SMTP id 5b1f17b1804b1-429d75baf27mr7985545e9.2.1723542625257;
        Tue, 13 Aug 2024 02:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMaj9XOn2VlLZwEVJcR8BVeb8TTkM2yAACsbWsK0tz+ZXqC0GqijJv0r2qYd9appKt9yE7Pg==
X-Received: by 2002:a05:600c:4f07:b0:426:6ea6:383d with SMTP id 5b1f17b1804b1-429d75baf27mr7985395e9.2.1723542624654;
        Tue, 13 Aug 2024 02:50:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1708:9110:151e:7458:b92f:3067? ([2a0d:3344:1708:9110:151e:7458:b92f:3067])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c77374a5sm132330955e9.30.2024.08.13.02.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 02:50:24 -0700 (PDT)
Message-ID: <764cf372-fcf3-410d-b48e-3fadc01f4707@redhat.com>
Date: Tue, 13 Aug 2024 11:50:20 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v2] net: wwan: t7xx: PCIe reset rescan
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com
References: <20240809033701.4414-1-jinjian.song@fibocom.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240809033701.4414-1-jinjian.song@fibocom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/24 05:37, Jinjian Song wrote:
> WWAN device is programmed to boot in normal mode or fastboot mode,
> when triggering a device reset through ACPI call or fastboot switch
> command.Maintain state machine synchronization and reprobe logic
	^^^      ^^^
Minor nits: missing space and missing article above.

> after a device reset.
> 
> Suggestion from Bjorn:
> Link: https://lore.kernel.org/all/20230127133034.GA1364550@bhelgaas/
> 
> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
> ---
> V2:
>   * initialize the variable 'ret' in t7xx_reset_device() function
> ---
>   drivers/net/wwan/t7xx/t7xx_modem_ops.c     | 47 ++++++++++++++++---
>   drivers/net/wwan/t7xx/t7xx_modem_ops.h     |  9 +++-
>   drivers/net/wwan/t7xx/t7xx_pci.c           | 53 ++++++++++++++++++----
>   drivers/net/wwan/t7xx/t7xx_pci.h           |  3 ++
>   drivers/net/wwan/t7xx/t7xx_port_proxy.c    |  1 -
>   drivers/net/wwan/t7xx/t7xx_port_trace.c    |  1 +
>   drivers/net/wwan/t7xx/t7xx_state_monitor.c | 34 +++++---------
>   7 files changed, 105 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_modem_ops.c b/drivers/net/wwan/t7xx/t7xx_modem_ops.c
> index 8d864d4ed77f..79f17100f70b 100644
> --- a/drivers/net/wwan/t7xx/t7xx_modem_ops.c
> +++ b/drivers/net/wwan/t7xx/t7xx_modem_ops.c
> @@ -53,6 +53,7 @@
>   
>   #define RGU_RESET_DELAY_MS	10
>   #define PORT_RESET_DELAY_MS	2000
> +#define FASTBOOT_RESET_DELAY_MS	2000
>   #define EX_HS_TIMEOUT_MS	5000
>   #define EX_HS_POLL_DELAY_MS	10
>   
> @@ -167,19 +168,52 @@ static int t7xx_acpi_reset(struct t7xx_pci_dev *t7xx_dev, char *fn_name)
>   	}
>   
>   	kfree(buffer.pointer);
> +#else
> +	struct device *dev = &t7xx_dev->pdev->dev;
> +	int ret;
>   
> +	ret = pci_reset_function(t7xx_dev->pdev);
> +	if (ret) {
> +		dev_err(dev, "Failed to reset device, error:%d\n", ret);
> +		return ret;
> +	}
>   #endif
>   	return 0;
>   }
>   
> -int t7xx_acpi_fldr_func(struct t7xx_pci_dev *t7xx_dev)
> +static void t7xx_host_event_notify(struct t7xx_pci_dev *t7xx_dev, unsigned int event_id)
>   {
> -	return t7xx_acpi_reset(t7xx_dev, "_RST");
> +	u32 value;
> +
> +	value = ioread32(IREG_BASE(t7xx_dev) + T7XX_PCIE_MISC_DEV_STATUS);
> +	value &= ~HOST_EVENT_MASK;
> +	value |= FIELD_PREP(HOST_EVENT_MASK, event_id);
> +	iowrite32(value, IREG_BASE(t7xx_dev) + T7XX_PCIE_MISC_DEV_STATUS);
>   }
>   
> -int t7xx_acpi_pldr_func(struct t7xx_pci_dev *t7xx_dev)
> +int t7xx_reset_device(struct t7xx_pci_dev *t7xx_dev, enum reset_type type)
>   {
> -	return t7xx_acpi_reset(t7xx_dev, "MRST._RST");
> +	int ret = 0;
> +
> +	pci_save_state(t7xx_dev->pdev);
> +	t7xx_pci_reprobe_early(t7xx_dev);
> +	t7xx_mode_update(t7xx_dev, T7XX_RESET);
> +
> +	if (type == FLDR) {
> +		ret = t7xx_acpi_reset(t7xx_dev, "_RST");
> +	} else if (type == PLDR) {
> +		ret = t7xx_acpi_reset(t7xx_dev, "MRST._RST");
> +	} else if (type == FASTBOOT) {
> +		t7xx_host_event_notify(t7xx_dev, FASTBOOT_DL_NOTIFY);
> +		t7xx_mhccif_h2d_swint_trigger(t7xx_dev, H2D_CH_DEVICE_RESET);
> +		msleep(FASTBOOT_RESET_DELAY_MS);

Did you test this with CONFIG_DEBUG_ATOMIC_SLEEP?

AFAICS the above adds a 2s (FASTBOOT_RESET_DELAY_MS) unconditional sleep 
for 'fastboot' inside am IRQ thread function via:

t7xx_rgu_isr_thread() -> t7xx_reset_device_via_pmic() -> t7xx_reset_device()

Well, the existing code already looks broken with a 10 ms sleep there, 
still...

> diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
> index 10a8c1080b10..2398f41046ce 100644
> --- a/drivers/net/wwan/t7xx/t7xx_pci.c
> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
> @@ -67,6 +67,7 @@ static ssize_t t7xx_mode_store(struct device *dev,
>   			       struct device_attribute *attr,
>   			       const char *buf, size_t count)
>   {
> +	enum t7xx_mode mode;
>   	struct t7xx_pci_dev *t7xx_dev;
>   	struct pci_dev *pdev;
>   	int index = 0;

Minor nit: please respect the reverse xmas tree above.

Cheers,

Paolo


