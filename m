Return-Path: <linux-doc+bounces-92256-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XaFbHsvsLGpdXgQAu9opvQ
	(envelope-from <linux-doc+bounces-92256-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 07:38:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C5367DCC1
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 07:38:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=UmeDBfwY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92256-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92256-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5D763217FF5
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 05:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305253CA499;
	Sat, 13 Jun 2026 05:30:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9343C98AF;
	Sat, 13 Jun 2026 05:30:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328636; cv=none; b=cVep1jZC+tEBY3a1UwnMuIACTEU41HDr670RrRHZP8LV5MwJvKftaYNVvWSzo0El1K4WtuzJ2SIBWjXjphXT7pLa/QXLvKXNjUkUePYItUMxjCDJVuZbasWH20/eHMfW7hY4RVbyyOlN+5H/3+FPsoZGI93ydNcNpmDwunQzvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328636; c=relaxed/simple;
	bh=MrF0RmPEqV9B1TPAtFfPJff7MVzbBYX4j3on5YbdV5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfT/QttBktXDhhPO3sL9fNT+oIaE7WmMk40POxJf5QexiLJcJh5py++otUjh3DKGe08zRnbivOE4HDso8Qx2fmvvZWG/oWyAWj6J0fcaMcTm+P/pqt0vwnwO9QH4EU+d3lJxtQ4cAZv88jyuJg0KLP72iWR9CuxnuGWIF/1YpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UmeDBfwY; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vrWOC4gao51KZuAhUbcrig6Szpodq0jj1juuJmBVdGg=; b=UmeDBfwYJ8iX+E1ZjqpUboHw72
	hfMriI4VIW+Pfrc5s4R3bo4fgvZ9v9mtcNOsAcpqJO+VEb8AfNQBPs7LlYBlt+e1Z1Knm7HQ8w+mL
	Ang3QWn9m9DBgY0YkCenX25wet2IpugTUBO8+7P6LhJwS8PwyeZGOxrcKfR+/fnFxTgA7NX4dCpwi
	SuWjXRL8IOqOJnImUtKk2daFkWlDsr5yN2nPQfx861t8P0kDbLsLPpEZGh3XpEI7P19y2a6nWKn6A
	9juqHajmGiKv12i1TIUSPZPmFn56h+iZjCbdl8XchQQ411BsaQL69yTNJ+wuObu7lMsMZiGp0S5OU
	EW1+bGaQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGwu-0000000ByDo-1a9i;
	Sat, 13 Jun 2026 05:30:28 +0000
Message-ID: <8c9f353c-3cf9-46bf-a872-3a4129c6f76d@infradead.org>
Date: Fri, 12 Jun 2026 22:30:26 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/31] [RFC] docs: stlmfs: Document ARM SCMI Telemetry
 FS ABI
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org, etienne.carriere@st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org,
 elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
 brauner@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
 kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
 kernel-team@meta.com
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
 <20260612223802.1337232-29-cristian.marussi@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260612223802.1337232-29-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92256-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.marussi@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,arm.com,linux.dev,meta.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:email,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2C5367DCC1



On 6/12/26 3:37 PM, Cristian Marussi wrote:
> Add full ABI dcoumentation for stlmfs under testing/
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v3 --> v4
>  - renamed to by-components
>  - updated date/versions
>  - changed output of des/0x<NNN>/value to -> <tstamp> <value>
>    (removed colon)
>  - added Rationale and Concurrency model
>  - added generation counter Description
> v2 --> v3
>  - complete ABI entries docs
> 
> RFC since unsure if place this into stable/ or testing/
> ---
>  Documentation/ABI/testing/stlmfs | 348 +++++++++++++++++++++++++++++++
>  1 file changed, 348 insertions(+)
>  create mode 100644 Documentation/ABI/testing/stlmfs
> 
> diff --git a/Documentation/ABI/testing/stlmfs b/Documentation/ABI/testing/stlmfs
> new file mode 100644
> index 000000000000..826092a4baf4
> --- /dev/null
> +++ b/Documentation/ABI/testing/stlmfs
> @@ -0,0 +1,348 @@
> +What:		/sys/fs/arm_telemetry/tlm_<N>/...
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Rationale:	This filesystem provides access to SCMI telemetry data and
> +		configuration.
> +		The interface is required to support:
> +		- hierarchical dynamically discovered telemetry objects
> +		- bulk data read across multiple sources
> +		- representation of complex structured data and their
> +		  relationship
> +		- alternative high-frequency data access (ioctl/mmap)
> +		These characteristics exceed the intended use of sysfs, which is
> +		designed to represent devices properties with simple attribute
> +		based configuration with one value per file: representing
> +		telemetry Data Events with devices was deemed an abuse by
> +		itself.
> +		A dedicated filesystem is therefore used to provide a more
> +		suitable abstraction for this class of functionality.
> +
> +Concurrency:	The telemetry configuration exposed through this filesystem is
> +		global to each SCMI telemetry instance, indentified by the top

		                                        identified

> +		tlm_<N> directory.
> +		Concurrent access from multiple user-space processes is allowed.
> +		The kernel does not enforce exclusivity or ownership of the
> +		interface.
> +		All configuration changes are applied immediately by issuing
> +		the related SCMI commands. Writes to different attributes may
> +		interleave and no atomicity across multiple files is guaranteed.
> +		In case of concurrent writes to the same attribute, the last
> +		writer wins.
> +		Read operations may observe state that has been already modified
> +		and it is stale.
> +		Userspace is responsible for coordinating access if stronger
> +		consistency or serialization is required and this filesystem
> +		provides a generation counter to aid in the detection of sudden
> +		configuration changes.
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/all_des_enable
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A boolean WO entry to enable all the discovered Data Events for
> +		SCMI instance <N>.
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/all_tstamp_des_enable
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A boolean WO entry to enable timestamps for all the discovered
> +		Data Events for SCMI instance <N>. (when available)
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/available_update_intervals_ms
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A RO entry that returns a space separated list of tuples of
> +		values, separated by a coma, each one representing a
> +		configurable update interval for SCMI instance <N>.
> +		Each tuple describes a possible update interval using the
> +		format <secs>,<exp> where the final represented interval is
> +		calculated as: <secs> * 10 ^ <exp>
> +		An example of list of tuples that can be read from this entry:
> +			3,0 4,-1 75,-2 300,-3 1,1 5,3 222,-7
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/by-components/
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A subdirectory that exposes an alternative topological view of
> +		the same set of discovered DEs that can be already found under
> +		the des/ branch.
> +		This topology subtree is built following this structure:
> +		    by-components/
> +		    ├── <COMPO_TYPE_STR>
> +		    │   ├── <COMPO_ISTANCE_ID>
> +		    │   │   ├── <DE_UNIT_TYPE_STR>
> +		    │   │   │   └── <DE_INSTANCE_ID>
> +		    │   │   │       └── 0x<DE_ID>[<DE_NAME>] -> ../../../../../des/0x<DE_ID>
> +
> +		The leaves are actual symlinks to an existing des/0x<DE_ID>
> +		subdirectory, while the naming of the subdirectories composing
> +		the inner nodes of the subtree are derived from the DataEvent
> +		Descriptor in SCMI v4.0 3.12.4.6.
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/control
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	An RW entry that can be used to discover, configure and retrieve
> +		Telemetry data using the alternative binary interface based on
> +		ioctls which is documented in include/uapi/linux/scmi.h
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/current_update_intervals_ms
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	An RW entry that can be used to get or set the platform update
> +		interval for SCMI instance <N>.
> +		On read the returned tuple represents the current update
> +		interval using the format <secs>,<exp> where the final
> +		represented interval is calculated as: <secs> * 10 ^ <exp>
> +		On write the accepted format is the same as on read <secs>,<exp>
> +		but, optionally, the second element of the tuple can be omitted
> +		and in that case the assumed value for the exponent will default
> +		to -3, i.e. milliseconds.
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/de_implementation_version
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A RO entry that returns a string representing the 128bit UUID
> +		that uniquely identifies the set of SCMI Telemetry Data Events
> +		and their semantic for SCMI instance <N>.
> +		This is compliant with the DE_IMPLEMENTATION_REVISION described
> +		in SCMI v4.0 Telemetry 3.12.4.3.
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/des_bulk_read
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A RO entry that returns a multi-line string containing all the
> +		the DEs enabled for SCMI instance <N>, one-per-line, formatted
> +		as: <DE_ID> <TIMESTAMP> <DATA_VALUE>
> +		These DEs readings represent the last value updated by the
> +		platform following the configured update interval: on the
> +		backend they will have been collected transparently in a number
> +		of different ways: on-demand SHMTI lookup, notifications,
> +		fastchannels. Data consistency is guaranteed by the underlying
> +		SCMI synchronization mechanisms.
> +		Any disabled or unavailable DE is simply NOT included.
> +Users:		Any userspace telemetry tool
> +
> +What:		/sys/fs/arm_telemetry/tlm_<N>/des_single_sample_read
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A RO entry that returns a multi-line string containing all the
> +		the DEs enabled for SCMI instance <N>, one-per-line, formmatted

		                                                     formatted

> +		as: <DE_ID> <TIMESTAMP> <DATA_VALUE>
> +		These DEs readings are generated by triggering an explicit and
> +		immediate platform update using single sample asynchronous
> +		collect methods.
> +		Any disabled or unavailable DE is simply NOT included.


-- 
~Randy


