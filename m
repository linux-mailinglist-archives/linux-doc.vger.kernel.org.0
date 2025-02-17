Return-Path: <linux-doc+bounces-37828-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E18F7A31BA2
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 02:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808943A6C4E
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 01:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC44886353;
	Wed, 12 Feb 2025 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vc758I9Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F911CA9C
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739325545; cv=none; b=J/V13q/YT6ZYkVOAjJTA566DQvZIqWNHOxQCh2a7cfPYrpeKNWbnlndy1wWSUAqPfrBBZGCLz69v/C9O9MVGJ3rGxGv1lULa5HXm2UgBMSqnxXKjLoU4XkaSXUZH2UrwN/AkdX1QtxOs5/tGAo3sY5/JdFCZpwnb4AE1EPGKgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739325545; c=relaxed/simple;
	bh=TgTFzIfKCXEPT/O7ObTgjTQk9DcHKZ5vxqv1bmZnltI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcWit2GRcUHeocYWF0WN8Ph6WYAVts+uJdgexMpGGvvLdPz2lPGkY/imPq7IO1VSPu11TgBAm2UmKTP6Yc2wXfA6fGEihbm0dyi7/ZZszzaZE3KuD9kI6GPr2gXQXcIU1ShGG12EvvC2uavmCKt/Q5Xr6tr22Q4wMhGh+Qfjpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vc758I9Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BIAceb008247
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 01:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awv0rGxstM311fFi4Sv24BEaC0+mwddjoTpetAR3/s4=; b=Vc758I9ZNeYjWDTN
	b8yxc7Os7WRcFZt7zsZAAiVHzTCLuno8/YYdiJwQM5/SSdBgxQtc+Kl9jObDLRah
	KrWwiyO37+5viWIJyMOCB5qJUiIFWdJjHnhaQ2nnoJhlFTJW5kGhh2nnQcXpIDfr
	08wS/bKMX9c1DWHzbRDHjn7RYuPUSvfRoLgL8jpWXZtjAYOgWFgH0Fh2yde3abms
	q+sn50VIuHwThLKAPIMsScI50Aef6zOsBYvYcBzISlKwVWT9zm00URsLhze9j0RM
	Hyqsme00ExNKBE0ruyNFgoISmthPmVPFJ4aYChmPKMIw6XCPfBSgqd7cs52Rm0E1
	J3pHNw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh5xg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 01:59:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa9bfea46aso3919317a91.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 17:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739325542; x=1739930342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awv0rGxstM311fFi4Sv24BEaC0+mwddjoTpetAR3/s4=;
        b=Yi0l0hnKXMXAjTXC/EHGPCytD2tYAfBi4k58vhQsFZhsGwRw4iIJOQoQnNwqT09o4T
         54+O/dvP0/3P/mxg5XK7GWq/MKQ7fh3D8A1Fsqn7rKLuA5A3P/rFhoom5Py1xbKmgKmi
         b3+rsszPjR1Q2eteCNbVdbJpjhbmlpl4qu6TjpKuRUC5EcHK9XeS92L25U89AbiTr1x+
         XSrRUKpGYqCXykA9qayr+ziGq8O8AqnVwN/qaZh4nhuYRt64Z89XlZwwiMMXPFQLZWWy
         oaxqfIJLeFc1qnr/DB6Ewj5zaH+W2jp0VjonnjUVTxPHcjIeIddGrWsNYKwkdo6smws1
         /CfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm2pSJzwlF3B6sYs1ebBG+dLsDD+if/hsRB7i8vYIinuXyGeXaw2msXomtjlGgH7hK9RnihveQ/I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoSyxfu/ULLVhXvjIKatigYXHog/8HWY/ORlvt1AVzv5qC5x6w
	MHcuARziZW/2jT/mYOkIOrBRyQASN7Pba+J3mrEi25JwNkUZNDmgbn568n/fp7+oRkQE6oYZt/M
	K1bdHwsD3TJ2myy65+p/JxuR55R8itKNh9yXMLtHp3zAzdldAEM3avVNFQJA=
X-Gm-Gg: ASbGncsYuSj3TsU5DYCYBtQSCAMPfB5tL7uR/BvLYZF+TT8onyURZvV5AsoDs+DbyXr
	8x3ED9uDsvBiN+/BJfe5vvuejw+WdVEaNRcrudmSG16IogFt2oPJnN+nJ9zGaD8jta0/TReoWth
	9jB0XsMZpZ68GC+6FLdtByYTsvs2XfyIDMI7YeWNAr91BUQMnMqMiGEnjrfkluZCZvt8n1FXZRC
	n/73a1vJWhhJUPUMCDPgvOECyU9umvNldBG+JGiHB8vA3SxmFu5+33Dp2lTGhIfolsEeYd5dfzU
	ijzibvzYB8yEuyO5cnCDmSd26bRZJFR11L5FjB3dhoQr3JN13lezX11TXZoj/1Xh
X-Received: by 2002:a05:6a20:918e:b0:1ee:49ca:759a with SMTP id adf61e73a8af0-1ee5c73340amr3109491637.2.1739325542309;
        Tue, 11 Feb 2025 17:59:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Ozamvj+FZMPdOC0mLlHyPulDXC1bHtTkbyAiVj5wsepcMbBLe+J/zsOKEgvKiq2TwNTNew==
X-Received: by 2002:a05:6a20:918e:b0:1ee:49ca:759a with SMTP id adf61e73a8af0-1ee5c73340amr3109438637.2.1739325541866;
        Tue, 11 Feb 2025 17:59:01 -0800 (PST)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73087d8dc08sm4990517b3a.128.2025.02.11.17.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 17:59:01 -0800 (PST)
Message-ID: <1882f5dd-4e46-40b9-977d-dc3570975738@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 09:58:53 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Jie Luo <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
        john@phrozen.org
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-3-453ea18d3271@quicinc.com>
 <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>
 <63f1d25c-087a-46dd-9053-60334a0095d5@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <63f1d25c-087a-46dd-9053-60334a0095d5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qMcLh9cgBgWFAgDy630UNiCUoFcFEsW6
X-Proofpoint-GUID: qMcLh9cgBgWFAgDy630UNiCUoFcFEsW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120014



On 2/11/2025 9:58 PM, Jie Luo wrote:
> 
> 
> On 2/10/2025 10:12 AM, Jie Gan wrote:
>>> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
>>> +{
>>> +    unsigned long ppe_rate = ppe_dev->clk_rate;
>>> +    struct device *dev = ppe_dev->dev;
>>> +    struct reset_control *rstc;
>>> +    struct clk_bulk_data *clks;
>>> +    struct clk *clk;
>>> +    int ret, i;
>>> +
>>> +    for (i = 0; i < ppe_dev->num_icc_paths; i++) {
>>> +        ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
>>> +        ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
>>> +                           Bps_to_icc(ppe_rate);
>> it's ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? 
>> ppe_icc_data[i].avg_bw : Bps_to_icc(ppe_rate);  ?
> 
> I feel the above used notation is also fine for readability, and is
> shorter and simpler.
> 
>>
>>
>>> +        ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
>>> +                        Bps_to_icc(ppe_rate);
>> Same with previous one?
> 
> Same response as for the previous comment is applicable here as well.
> 
>>
>>> +    }
>>> +
>>> +    ret = devm_of_icc_bulk_get(dev, ppe_dev->num_icc_paths,
>>> +                   ppe_dev->icc_paths);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = icc_bulk_set_bw(ppe_dev->num_icc_paths, ppe_dev->icc_paths);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* The PPE clocks have a common parent clock. Setting the clock
>> Should be:
>> /*
>>   * The PPE clocks have a common parent clock. Setting the clock
>>   * rate of "ppe" ensures the clock rate of all PPE clocks is
>>   * configured to the same rate.
>>   */
>>
> 
> I think for drivers/net, the above format follows the recommended
> commenting style. Pls see: https://www.kernel.org/doc/html/v6.10/
> process/coding-style.html
> 
> For files in net/ and drivers/net/ the preferred style for long
> (multi-line) comments is a little different.
> 
>> BTW, it's better wrapped with ~75 characters per line.
> 
> Yes, the comments should be wrapped to ~75 characters.
> 
>>
>>> +     * rate of "ppe" ensures the clock rate of all PPE clocks is
>>> +     * configured to the same rate.
>>> +     */
>>> +    clk = devm_clk_get(dev, "ppe");
>>> +    if (IS_ERR(clk))
>>> +        return PTR_ERR(clk);
>>> +
>>> +    ret = clk_set_rate(clk, ppe_rate);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = devm_clk_bulk_get_all_enabled(dev, &clks);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    /* Reset the PPE. */
>>> +    rstc = devm_reset_control_get_exclusive(dev, NULL);
>>> +    if (IS_ERR(rstc))
>>> +        return PTR_ERR(rstc);
>>> +
>>> +    ret = reset_control_assert(rstc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* The delay 10 ms of assert is necessary for resetting PPE. */
>>> +    usleep_range(10000, 11000);
>>> +
>>> +    return reset_control_deassert(rstc);
>>> +}
>>> +
>>> +static int qcom_ppe_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    struct ppe_device *ppe_dev;
>>> +    void __iomem *base;
>>> +    int ret, num_icc;
>> I think it's better with:
>>      int num_icc = ARRAY_SIZE(ppe_icc_data);
> 
> This will impact the “reverse xmas tree” rule for local variable
> definitions. Also, the num_icc will vary as per the different SoC,
> so we will need to initialize the num_icc in a separate statement.
> 
> (Note: This driver will be extended to support different SoC in
> the future.)
> 
Got your point here. So there may have multiple definitions like 
ppe_icc_data here, right? But the num_icc here is hardcoded.
Maybe it would be better defined within the ppe_icc_data, if possible?
Then just directly use ppe_icc_data->num_icc?

Never mind, that's just my thought on the flexibility.

Jie
>>
>>> +
>>> +    num_icc = ARRAY_SIZE(ppe_icc_data);
>>> +    ppe_dev = devm_kzalloc(dev, struct_size(ppe_dev, icc_paths, 
>>> num_icc),
>>> +                   GFP_KERNEL);
>>> +    if (!ppe_dev)
>>> +        return -ENOMEM;
>>> +
>>> +    base = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(base))
>>> +        return dev_err_probe(dev, PTR_ERR(base), "PPE ioremap 
>>> failed\n");
>>> +
>>> +    ppe_dev->regmap = devm_regmap_init_mmio(dev, base, 
>>> &regmap_config_ipq9574);
>>> +    if (IS_ERR(ppe_dev->regmap))
>>> +        return dev_err_probe(dev, PTR_ERR(ppe_dev->regmap),
>>> +                     "PPE initialize regmap failed\n");
>>> +    ppe_dev->dev = dev;
>>> +    ppe_dev->clk_rate = PPE_CLK_RATE;
>>> +    ppe_dev->num_ports = PPE_PORT_MAX;
>>> +    ppe_dev->num_icc_paths = num_icc;
>>> +
>>> +    ret = ppe_clock_init_and_reset(ppe_dev);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "PPE clock config failed\n");
>>> +
>>> +    platform_set_drvdata(pdev, ppe_dev);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct of_device_id qcom_ppe_of_match[] = {
>>> +    { .compatible = "qcom,ipq9574-ppe" },
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, qcom_ppe_of_match);
>>> +
>>> +static struct platform_driver qcom_ppe_driver = {
>>> +    .driver = {
>>> +        .name = "qcom_ppe",
>>> +        .of_match_table = qcom_ppe_of_match,
>>> +    },
>>> +    .probe    = qcom_ppe_probe,
>>> +};
>>> +module_platform_driver(qcom_ppe_driver);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. IPQ PPE driver");
>>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.h b/drivers/net/ 
>>> ethernet/qualcomm/ppe/ppe.h
>>> new file mode 100644
>>> index 000000000000..cc6767b7c2b8
>>> --- /dev/null
>>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe.h
>>> @@ -0,0 +1,36 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only
>>> + *
>>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + */
>>> +
>>> +#ifndef __PPE_H__
>>> +#define __PPE_H__
>>> +
>>> +#include <linux/compiler.h>
>>> +#include <linux/interconnect.h>
>>> +
>>> +struct device;
>> #include <linux/device.h> ?
>>
>>> +struct regmap;
>> Same with previous one, include it's header file?
> 
> The driver only need to reference these structures but don't
> need their full definitions. So it should be fine to declare
> the existence of these structures here.
> 
>>
>>> +
>>> +/**
>>> + * struct ppe_device - PPE device private data.
>>> + * @dev: PPE device structure.
>>> + * @regmap: PPE register map.
>>> + * @clk_rate: PPE clock rate.
>>> + * @num_ports: Number of PPE ports.
>>> + * @num_icc_paths: Number of interconnect paths.
>>> + * @icc_paths: Interconnect path array.
>>> + *
>>> + * PPE device is the instance of PPE hardware, which is used to
>>> + * configure PPE packet process modules such as BM (buffer management),
>>> + * QM (queue management), and scheduler.
>>> + */
>>> +struct ppe_device {
>>> +    struct device *dev;
>>> +    struct regmap *regmap;
>>> +    unsigned long clk_rate;
>>> +    unsigned int num_ports;
>>> +    unsigned int num_icc_paths;
>>> +    struct icc_bulk_data icc_paths[] __counted_by(num_icc_paths);
>>> +};
>>> +#endif
>>>
>>
>> Thanks,
>> Jie
> 


