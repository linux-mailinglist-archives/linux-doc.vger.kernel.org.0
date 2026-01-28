Return-Path: <linux-doc+bounces-74346-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAsNGLZhemk75gEAu9opvQ
	(envelope-from <linux-doc+bounces-74346-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 20:21:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE202A8208
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 20:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A033C301A176
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 19:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB51736F421;
	Wed, 28 Jan 2026 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BY/ljl4N"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B20234964;
	Wed, 28 Jan 2026 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769628083; cv=none; b=YQS7C3akqC9hPgPHE0oAFznpME6lOyUTtXxYimMDb777DZCYjLs4/ieVMax0qHQuBEbz5ISsh8AYTcA7aRIE3udhRoK0gbJN/mkhiSSizaPcMfAgHQHgak/xBUT7DlrLs2VQ296hM9J+qahLf98wwcRHYnHg2svohrG3/6TZjp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769628083; c=relaxed/simple;
	bh=iLoOYA1LMq3BtOPeVT6M6IA6phTAG9HH2xcu6IjNSk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGo4Z+eX/C2L7yKhg87imyH9njjoYh+3H3lkeT9Mb5IKNSMpO1BQ++h5zf7uJ0k9XxKgB8hOk+inPByAjwQsgdOF4Z+166PJYS5So8nXMzMzmBdNjZxky1N2ce4CY2KR7KJ6P0fIzneLEc0fpEsfUjD0Dv9FAL/mb19YobXiwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BY/ljl4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324E9C4CEF1;
	Wed, 28 Jan 2026 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769628083;
	bh=iLoOYA1LMq3BtOPeVT6M6IA6phTAG9HH2xcu6IjNSk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BY/ljl4NggvSemqyIixJLsxYfQhTkEiDhYYd7YtVXWSuX/VAm1aNzm2Y0JBn70kPu
	 zsL9RpCyCzKpkcwPOYOkSSq7kPpVicJHy5eV1hwO68CFWnSWJAD10PNhOCP4Fe41re
	 YzaHG87r7cfue/UpJC+pkc8VXiJYf4Qak8869lz6hTvlDl+53jP55I7Z9DPThLh8Sz
	 NzQ1bflESlnUFW5OPDadd8+c4Rd2JuZEWMiFy9asIAy75iJd7iAD0fltubT5vO+jWH
	 efydAmoxKtgmVSEyGkS6pLjPoVxZyL0nwWyq9ovIXP+GpC3Ksx1cuDJd8zNW7gjs02
	 /g7fpJmP3e8hg==
Date: Wed, 28 Jan 2026 20:21:18 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Frank.Li@nxp.com, dlemoal@kernel.org, Koichiro Den <den@valinux.co.jp>,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] PCI: endpoint: pci-epf-test: Allow overriding default
 BAR sizes
Message-ID: <aXphrhdY8ZBKBOEF@ryzen>
References: <20260128171157.1795146-2-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128171157.1795146-2-cassel@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74346-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE202A8208
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 06:11:57PM +0100, Niklas Cassel wrote:
> @@ -1312,6 +1315,87 @@ static void pci_epf_test_unbind(struct pci_epf *epf)
>  	pci_epf_test_free_space(epf);
>  }
>  
> +#define PCI_EPF_TEST_BAR_SIZE_R(_name, _id)				\
> +	static ssize_t pci_epf_test_##_name##_show(struct config_item *item,	\
> +						   char *page)		\
> +	{								\
> +		struct config_group *group = to_config_group(item);	\
> +		struct pci_epf_test *epf_test = container_of(group,	\
> +					struct pci_epf_test, group);	\
> +									\
> +		return sprintf(page, "%zu\n", epf_test->bar_size[_id]);	\
> +	}
> +
> +#define PCI_EPF_TEST_BAR_SIZE_W(_name, _id)				\
> +	static ssize_t pci_epf_test_##_name##_store(struct config_item *item, \
> +						    const char *page, size_t len) \
> +	{								\
> +		struct config_group *group = to_config_group(item);	\
> +		struct pci_epf_test *epf_test = container_of(group,	\
> +					struct pci_epf_test, group);	\
> +		int val;						\
> +		int ret;						\
> +									\
> +		ret = kstrtouint(page, 0, &val);			\
> +		if (ret)						\
> +			return ret;					\
> +									\
> +		if (!is_power_of_2(val))				\
> +			return -EINVAL;					\
> +									\
> +		epf_test->bar_size[_id] = val;				\
> +									\
> +		return len;						\
> +	}
> +

This code does not handle:

# echo 1024 > functions/pci_epf_test/func1/pci_epf_test.0/bar1_size
# echo 0 > controllers/a40000000.pcie-ep/start
# echo 2048 > functions/pci_epf_test/func1/pci_epf_test.0/bar1_size
# echo 1 > controllers/a40000000.pcie-ep/start

Since backing memory for a BAR is allocated in .bind()

And set_bar() is called in .epc_init()

Setting/overriding the BAR size must be done before .bind(), i.e.
at probe() time.
(probe() is called when doing: mkdir functions/pci_epf_test/func1 in configfs)

Therefore, we must make sure that modifying bar*_size after the EPF has
been bound to a EPC will result in an error.

Will send a V3.


Kind regards,
Niklas

