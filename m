Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B55515C02
	for <lists+linux-doc@lfdr.de>; Sat, 30 Apr 2022 11:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382549AbiD3JgZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 30 Apr 2022 05:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiD3JgZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Apr 2022 05:36:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3F78BF71;
        Sat, 30 Apr 2022 02:33:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9125BB818F6;
        Sat, 30 Apr 2022 09:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA01AC385AA;
        Sat, 30 Apr 2022 09:32:54 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V9 24/24] LoongArch: Add Loongson-3 default config file
Date:   Sat, 30 Apr 2022 17:05:18 +0800
Message-Id: <20220430090518.3127980-25-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220430090518.3127980-1-chenhuacai@loongson.cn>
References: <20220430090518.3127980-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_75_100 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a default config file for LoongArch-based Loongson-3
platform.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Makefile                    |   2 +
 arch/loongarch/configs/loongson3_defconfig | 770 +++++++++++++++++++++
 2 files changed, 772 insertions(+)
 create mode 100644 arch/loongarch/configs/loongson3_defconfig

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 1ed5b8466565..952dc6c163b0 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -5,6 +5,8 @@
 
 boot	:= arch/loongarch/boot
 
+KBUILD_DEFCONFIG := loongson3_defconfig
+
 ifndef CONFIG_SYS_SUPPORTS_ZBOOT
 
 ifndef CONFIG_EFI_STUB
diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
new file mode 100644
index 000000000000..e7812e20082b
--- /dev/null
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -0,0 +1,770 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_PREEMPT=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_LOG_BUF_SHIFT=18
+CONFIG_NUMA_BALANCING=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_HUGETLB=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_RELAY=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_USERFAULTFD=y
+CONFIG_PERF_EVENTS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_LOONGARCH=y
+CONFIG_64BIT=y
+CONFIG_MACH_LOONGSON64=y
+CONFIG_DMI=y
+CONFIG_EFI=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=64
+CONFIG_NUMA=y
+CONFIG_PAGE_SIZE_16KB=y
+CONFIG_HZ_250=y
+CONFIG_ACPI=y
+CONFIG_ACPI_SPCR_TABLE=y
+CONFIG_ACPI_HOTPLUG_CPU=y
+CONFIG_ACPI_TAD=y
+CONFIG_ACPI_DOCK=y
+CONFIG_ACPI_IPMI=m
+CONFIG_ACPI_PCI_SLOT=y
+CONFIG_ACPI_HOTPLUG_MEMORY=y
+CONFIG_SYSFB_SIMPLEFB=y
+CONFIG_EFI_CAPSULE_LOADER=m
+CONFIG_EFI_TEST=m
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_BLK_DEV_THROTTLING=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_IOSCHED_BFQ=y
+CONFIG_BFQ_GROUP_IOSCHED=y
+CONFIG_BINFMT_MISC=m
+CONFIG_MEMORY_HOTPLUG=y
+CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
+CONFIG_MEMORY_HOTREMOVE=y
+CONFIG_KSM=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_ZSWAP=y
+CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
+CONFIG_ZPOOL=y
+CONFIG_ZBUD=y
+CONFIG_Z3FOLD=y
+CONFIG_ZSMALLOC=m
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM_USER=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NET_IPIP=m
+CONFIG_IP_MROUTE=y
+CONFIG_INET_ESP=m
+CONFIG_INET_UDP_DIAG=y
+CONFIG_TCP_CONG_ADVANCED=y
+CONFIG_TCP_CONG_BBR=m
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_ROUTE_INFO=y
+CONFIG_IPV6_MROUTE=y
+CONFIG_NETWORK_PHY_TIMESTAMPING=y
+CONFIG_NETFILTER=y
+CONFIG_BRIDGE_NETFILTER=m
+CONFIG_NETFILTER_NETLINK_LOG=m
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_NETDEV=m
+CONFIG_NF_CONNTRACK_AMANDA=m
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_NETBIOS_NS=m
+CONFIG_NF_CONNTRACK_TFTP=m
+CONFIG_NF_CT_NETLINK=m
+CONFIG_NF_TABLES=m
+CONFIG_NFT_COUNTER=m
+CONFIG_NFT_CONNLIMIT=m
+CONFIG_NFT_LOG=m
+CONFIG_NFT_LIMIT=m
+CONFIG_NFT_MASQ=m
+CONFIG_NFT_REDIR=m
+CONFIG_NFT_NAT=m
+CONFIG_NFT_TUNNEL=m
+CONFIG_NFT_OBJREF=m
+CONFIG_NFT_QUEUE=m
+CONFIG_NFT_QUOTA=m
+CONFIG_NFT_REJECT=m
+CONFIG_NFT_COMPAT=m
+CONFIG_NFT_HASH=m
+CONFIG_NFT_SOCKET=m
+CONFIG_NFT_OSF=m
+CONFIG_NFT_TPROXY=m
+CONFIG_NETFILTER_XT_SET=m
+CONFIG_NETFILTER_XT_TARGET_AUDIT=m
+CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
+CONFIG_NETFILTER_XT_TARGET_CT=m
+CONFIG_NETFILTER_XT_TARGET_DSCP=m
+CONFIG_NETFILTER_XT_TARGET_HMARK=m
+CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
+CONFIG_NETFILTER_XT_TARGET_LED=m
+CONFIG_NETFILTER_XT_TARGET_LOG=m
+CONFIG_NETFILTER_XT_TARGET_MARK=m
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
+CONFIG_NETFILTER_XT_TARGET_TRACE=m
+CONFIG_NETFILTER_XT_TARGET_SECMARK=m
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
+CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
+CONFIG_NETFILTER_XT_MATCH_BPF=m
+CONFIG_NETFILTER_XT_MATCH_CGROUP=m
+CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
+CONFIG_NETFILTER_XT_MATCH_COMMENT=m
+CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
+CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
+CONFIG_NETFILTER_XT_MATCH_CPU=m
+CONFIG_NETFILTER_XT_MATCH_DCCP=m
+CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
+CONFIG_NETFILTER_XT_MATCH_DSCP=m
+CONFIG_NETFILTER_XT_MATCH_ESP=m
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
+CONFIG_NETFILTER_XT_MATCH_HELPER=m
+CONFIG_NETFILTER_XT_MATCH_IPCOMP=m
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
+CONFIG_NETFILTER_XT_MATCH_IPVS=m
+CONFIG_NETFILTER_XT_MATCH_LENGTH=m
+CONFIG_NETFILTER_XT_MATCH_LIMIT=m
+CONFIG_NETFILTER_XT_MATCH_MAC=m
+CONFIG_NETFILTER_XT_MATCH_MARK=m
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
+CONFIG_NETFILTER_XT_MATCH_NFACCT=m
+CONFIG_NETFILTER_XT_MATCH_OSF=m
+CONFIG_NETFILTER_XT_MATCH_OWNER=m
+CONFIG_NETFILTER_XT_MATCH_POLICY=m
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
+CONFIG_NETFILTER_XT_MATCH_QUOTA=m
+CONFIG_NETFILTER_XT_MATCH_RATEEST=m
+CONFIG_NETFILTER_XT_MATCH_REALM=m
+CONFIG_NETFILTER_XT_MATCH_SOCKET=m
+CONFIG_NETFILTER_XT_MATCH_STATE=m
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
+CONFIG_NETFILTER_XT_MATCH_STRING=m
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
+CONFIG_NETFILTER_XT_MATCH_TIME=m
+CONFIG_NETFILTER_XT_MATCH_U32=m
+CONFIG_IP_SET=m
+CONFIG_IP_VS=m
+CONFIG_IP_VS_IPV6=y
+CONFIG_IP_VS_PROTO_TCP=y
+CONFIG_IP_VS_PROTO_UDP=y
+CONFIG_IP_VS_RR=m
+CONFIG_IP_VS_NFCT=y
+CONFIG_NF_TABLES_IPV4=y
+CONFIG_NFT_DUP_IPV4=m
+CONFIG_NFT_FIB_IPV4=m
+CONFIG_NF_TABLES_ARP=y
+CONFIG_NF_LOG_ARP=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_RPFILTER=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_SYNPROXY=m
+CONFIG_IP_NF_NAT=m
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_IP_NF_MANGLE=m
+CONFIG_IP_NF_TARGET_CLUSTERIP=m
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_SECURITY=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+CONFIG_NF_TABLES_IPV6=y
+CONFIG_IP6_NF_IPTABLES=y
+CONFIG_IP6_NF_MATCH_AH=m
+CONFIG_IP6_NF_MATCH_EUI64=m
+CONFIG_IP6_NF_MATCH_FRAG=m
+CONFIG_IP6_NF_MATCH_OPTS=m
+CONFIG_IP6_NF_MATCH_IPV6HEADER=m
+CONFIG_IP6_NF_MATCH_MH=m
+CONFIG_IP6_NF_MATCH_RPFILTER=m
+CONFIG_IP6_NF_MATCH_RT=m
+CONFIG_IP6_NF_MATCH_SRH=m
+CONFIG_IP6_NF_FILTER=y
+CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP6_NF_TARGET_SYNPROXY=m
+CONFIG_IP6_NF_MANGLE=m
+CONFIG_IP6_NF_RAW=m
+CONFIG_IP6_NF_SECURITY=m
+CONFIG_IP6_NF_NAT=m
+CONFIG_IP6_NF_TARGET_MASQUERADE=m
+CONFIG_IP6_NF_TARGET_NPT=m
+CONFIG_NF_TABLES_BRIDGE=m
+CONFIG_BRIDGE_NF_EBTABLES=m
+CONFIG_BRIDGE_EBT_BROUTE=m
+CONFIG_BRIDGE_EBT_T_FILTER=m
+CONFIG_BRIDGE_EBT_T_NAT=m
+CONFIG_BRIDGE_EBT_ARP=m
+CONFIG_BRIDGE_EBT_IP=m
+CONFIG_BRIDGE_EBT_IP6=m
+CONFIG_BPFILTER=y
+CONFIG_IP_SCTP=m
+CONFIG_RDS=y
+CONFIG_L2TP=m
+CONFIG_BRIDGE=m
+CONFIG_VLAN_8021Q=m
+CONFIG_VLAN_8021Q_GVRP=y
+CONFIG_VLAN_8021Q_MVRP=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_HTB=m
+CONFIG_NET_SCH_PRIO=m
+CONFIG_NET_SCH_SFQ=m
+CONFIG_NET_SCH_TBF=m
+CONFIG_NET_SCH_NETEM=m
+CONFIG_NET_SCH_INGRESS=m
+CONFIG_NET_CLS_BASIC=m
+CONFIG_NET_CLS_FW=m
+CONFIG_NET_CLS_U32=m
+CONFIG_NET_CLS_CGROUP=m
+CONFIG_NET_CLS_BPF=m
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_ACT_POLICE=m
+CONFIG_NET_ACT_GACT=m
+CONFIG_NET_ACT_MIRRED=m
+CONFIG_NET_ACT_IPT=m
+CONFIG_NET_ACT_NAT=m
+CONFIG_NET_ACT_BPF=m
+CONFIG_OPENVSWITCH=m
+CONFIG_NETLINK_DIAG=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_BT=m
+CONFIG_BT_HCIBTUSB=m
+# CONFIG_BT_HCIBTUSB_BCM is not set
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_INPUT=y
+CONFIG_NET_9P=y
+CONFIG_CEPH_LIB=m
+CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_PCIEAER=y
+# CONFIG_PCIEASPM is not set
+CONFIG_PCI_IOV=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_SHPC=y
+CONFIG_PCCARD=m
+CONFIG_YENTA=m
+CONFIG_RAPIDIO=y
+CONFIG_RAPIDIO_TSI721=y
+CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
+CONFIG_RAPIDIO_ENUM_BASIC=m
+CONFIG_RAPIDIO_CHMAN=m
+CONFIG_RAPIDIO_MPORT_CDEV=m
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=m
+CONFIG_MTD_BLOCK=m
+CONFIG_MTD_CFI=m
+CONFIG_MTD_JEDECPROBE=m
+CONFIG_MTD_CFI_INTELEXT=m
+CONFIG_MTD_CFI_AMDSTD=m
+CONFIG_MTD_CFI_STAA=m
+CONFIG_MTD_RAM=m
+CONFIG_MTD_ROM=m
+CONFIG_PARPORT=y
+CONFIG_PARPORT_PC=y
+CONFIG_PARPORT_SERIAL=y
+CONFIG_PARPORT_PC_FIFO=y
+CONFIG_ZRAM=m
+CONFIG_ZRAM_DEF_COMP_ZSTD=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_CRYPTOLOOP=y
+CONFIG_BLK_DEV_NBD=m
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_BLK_DEV_RBD=m
+CONFIG_BLK_DEV_NVME=y
+CONFIG_EEPROM_AT24=m
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_CHR_DEV_SCH=m
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SPI_ATTRS=m
+CONFIG_SCSI_FC_ATTRS=m
+CONFIG_SCSI_SAS_ATA=y
+CONFIG_ISCSI_TCP=m
+CONFIG_SCSI_MVSAS=y
+# CONFIG_SCSI_MVSAS_DEBUG is not set
+CONFIG_SCSI_MVSAS_TASKLET=y
+CONFIG_SCSI_MVUMI=y
+CONFIG_MEGARAID_NEWGEN=y
+CONFIG_MEGARAID_MM=y
+CONFIG_MEGARAID_MAILBOX=y
+CONFIG_MEGARAID_LEGACY=y
+CONFIG_MEGARAID_SAS=y
+CONFIG_SCSI_MPT2SAS=y
+CONFIG_LIBFC=m
+CONFIG_LIBFCOE=m
+CONFIG_FCOE=m
+CONFIG_SCSI_QLOGIC_1280=m
+CONFIG_SCSI_QLA_FC=m
+CONFIG_TCM_QLA2XXX=m
+CONFIG_SCSI_QLA_ISCSI=m
+CONFIG_SCSI_LPFC=m
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_PATA_ATIIXP=y
+CONFIG_PATA_PCMCIA=m
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=m
+CONFIG_MD_LINEAR=m
+CONFIG_MD_RAID0=m
+CONFIG_MD_RAID1=m
+CONFIG_MD_RAID10=m
+CONFIG_MD_RAID456=m
+CONFIG_MD_MULTIPATH=m
+CONFIG_BCACHE=m
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_CRYPT=m
+CONFIG_DM_SNAPSHOT=m
+CONFIG_DM_THIN_PROVISIONING=m
+CONFIG_DM_CACHE=m
+CONFIG_DM_WRITECACHE=m
+CONFIG_DM_MIRROR=m
+CONFIG_DM_RAID=m
+CONFIG_DM_ZERO=m
+CONFIG_DM_MULTIPATH=m
+CONFIG_DM_MULTIPATH_QL=m
+CONFIG_DM_MULTIPATH_ST=m
+CONFIG_TARGET_CORE=m
+CONFIG_TCM_IBLOCK=m
+CONFIG_TCM_FILEIO=m
+CONFIG_TCM_PSCSI=m
+CONFIG_TCM_USER2=m
+CONFIG_LOOPBACK_TARGET=m
+CONFIG_ISCSI_TARGET=m
+CONFIG_NETDEVICES=y
+CONFIG_BONDING=m
+CONFIG_DUMMY=y
+CONFIG_WIREGUARD=m
+CONFIG_MACVLAN=m
+CONFIG_MACVTAP=m
+CONFIG_IPVLAN=m
+CONFIG_VXLAN=y
+CONFIG_RIONET=m
+CONFIG_TUN=m
+CONFIG_VETH=m
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+CONFIG_BNX2=y
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+CONFIG_CHELSIO_T1=m
+CONFIG_CHELSIO_T1_1G=y
+CONFIG_CHELSIO_T3=m
+CONFIG_CHELSIO_T4=m
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+# CONFIG_NET_VENDOR_I825XX is not set
+CONFIG_E1000=y
+CONFIG_E1000E=y
+CONFIG_IGB=y
+CONFIG_IXGB=y
+CONFIG_IXGBE=y
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RDC is not set
+CONFIG_8139CP=m
+CONFIG_8139TOO=m
+CONFIG_R8169=y
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+CONFIG_STMMAC_ETH=y
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPP_FILTER=y
+CONFIG_PPP_MPPE=m
+CONFIG_PPP_MULTILINK=y
+CONFIG_PPPOE=m
+CONFIG_PPPOL2TP=m
+CONFIG_PPP_ASYNC=m
+CONFIG_PPP_SYNC_TTY=m
+CONFIG_USB_RTL8150=m
+CONFIG_USB_RTL8152=m
+# CONFIG_USB_NET_AX8817X is not set
+# CONFIG_USB_NET_AX88179_178A is not set
+CONFIG_USB_NET_CDC_EEM=m
+CONFIG_USB_NET_HUAWEI_CDC_NCM=m
+CONFIG_USB_NET_CDC_MBIM=m
+# CONFIG_USB_NET_NET1080 is not set
+# CONFIG_USB_BELKIN is not set
+# CONFIG_USB_ARMLINUX is not set
+# CONFIG_USB_NET_ZAURUS is not set
+CONFIG_ATH9K=m
+CONFIG_ATH9K_HTC=m
+CONFIG_IWLWIFI=m
+CONFIG_IWLDVM=m
+CONFIG_IWLMVM=m
+CONFIG_IWLWIFI_BCAST_FILTERING=y
+CONFIG_HOSTAP=m
+CONFIG_MT7601U=m
+CONFIG_RT2X00=m
+CONFIG_RT2800USB=m
+CONFIG_RTL8192CE=m
+CONFIG_RTL8192SE=m
+CONFIG_RTL8192DE=m
+CONFIG_RTL8723AE=m
+CONFIG_RTL8723BE=m
+CONFIG_RTL8188EE=m
+CONFIG_RTL8192EE=m
+CONFIG_RTL8821AE=m
+CONFIG_RTL8192CU=m
+# CONFIG_RTLWIFI_DEBUG is not set
+CONFIG_RTL8XXXU=m
+CONFIG_ZD1211RW=m
+CONFIG_USB_NET_RNDIS_WLAN=m
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_XTKBD=m
+CONFIG_MOUSE_PS2_ELANTECH=y
+CONFIG_MOUSE_PS2_SENTELIC=y
+CONFIG_MOUSE_SERIAL=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=m
+CONFIG_SERIO_SERPORT=m
+CONFIG_SERIO_RAW=m
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=16
+CONFIG_SERIAL_8250_RUNTIME_UARTS=16
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_NONSTANDARD=y
+CONFIG_PRINTER=m
+CONFIG_IPMI_HANDLER=m
+CONFIG_IPMI_DEVICE_INTERFACE=m
+CONFIG_IPMI_SI=m
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_PIIX4=y
+CONFIG_I2C_GPIO=y
+CONFIG_SPI=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_LOONGSON=y
+CONFIG_SENSORS_LM75=m
+CONFIG_SENSORS_LM93=m
+CONFIG_SENSORS_W83795=m
+CONFIG_SENSORS_W83627HF=m
+CONFIG_RC_CORE=m
+CONFIG_LIRC=y
+CONFIG_RC_DECODERS=y
+CONFIG_IR_NEC_DECODER=m
+CONFIG_IR_RC5_DECODER=m
+CONFIG_IR_RC6_DECODER=m
+CONFIG_IR_JVC_DECODER=m
+CONFIG_IR_SONY_DECODER=m
+CONFIG_IR_SANYO_DECODER=m
+CONFIG_IR_SHARP_DECODER=m
+CONFIG_IR_MCE_KBD_DECODER=m
+CONFIG_IR_XMP_DECODER=m
+CONFIG_IR_IMON_DECODER=m
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+CONFIG_MEDIA_PCI_SUPPORT=y
+CONFIG_VIDEO_BT848=m
+CONFIG_DVB_BT8XX=m
+CONFIG_DRM=y
+CONFIG_DRM_RADEON=m
+CONFIG_DRM_RADEON_USERPTR=y
+CONFIG_DRM_AMDGPU=m
+CONFIG_DRM_AMDGPU_SI=y
+CONFIG_DRM_AMDGPU_CIK=y
+CONFIG_DRM_AMDGPU_USERPTR=y
+CONFIG_DRM_AST=y
+CONFIG_FB=y
+CONFIG_FB_EFI=y
+CONFIG_FB_RADEON=y
+CONFIG_LCD_PLATFORM=m
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_LOGO=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_DUMMY=m
+# CONFIG_SND_ISA is not set
+CONFIG_SND_BT87X=m
+CONFIG_SND_BT87X_OVERCLOCK=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_HWDEP=y
+CONFIG_SND_HDA_INPUT_BEEP=y
+CONFIG_SND_HDA_PATCH_LOADER=y
+CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_SIGMATEL=y
+CONFIG_SND_HDA_CODEC_HDMI=y
+CONFIG_SND_HDA_CODEC_CONEXANT=y
+CONFIG_SND_USB_AUDIO=m
+CONFIG_HIDRAW=y
+CONFIG_UHID=m
+CONFIG_HID_A4TECH=m
+CONFIG_HID_CHERRY=m
+CONFIG_HID_LOGITECH=m
+CONFIG_HID_LOGITECH_DJ=m
+CONFIG_LOGITECH_FF=y
+CONFIG_LOGIRUMBLEPAD2_FF=y
+CONFIG_LOGIG940_FF=y
+CONFIG_HID_MICROSOFT=m
+CONFIG_HID_MULTITOUCH=m
+CONFIG_HID_SUNPLUS=m
+CONFIG_USB_HIDDEV=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_MON=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_UHCI_HCD=m
+CONFIG_USB_ACM=m
+CONFIG_USB_PRINTER=m
+CONFIG_USB_STORAGE=m
+CONFIG_USB_STORAGE_REALTEK=m
+CONFIG_USB_UAS=m
+CONFIG_USB_DWC2=y
+CONFIG_USB_DWC2_HOST=y
+CONFIG_USB_SERIAL=m
+CONFIG_USB_SERIAL_CH341=m
+CONFIG_USB_SERIAL_CP210X=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_SERIAL_OPTION=m
+CONFIG_USB_GADGET=y
+CONFIG_INFINIBAND=m
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_EFI=y
+CONFIG_DMADEVICES=y
+CONFIG_UIO=m
+CONFIG_UIO_PDRV_GENIRQ=m
+CONFIG_UIO_DMEM_GENIRQ=m
+CONFIG_UIO_PCI_GENERIC=m
+# CONFIG_VIRTIO_MENU is not set
+CONFIG_COMEDI=m
+CONFIG_COMEDI_PCI_DRIVERS=m
+CONFIG_COMEDI_8255_PCI=m
+CONFIG_COMEDI_ADL_PCI6208=m
+CONFIG_COMEDI_ADL_PCI7X3X=m
+CONFIG_COMEDI_ADL_PCI8164=m
+CONFIG_COMEDI_ADL_PCI9111=m
+CONFIG_COMEDI_ADL_PCI9118=m
+CONFIG_COMEDI_ADV_PCI1710=m
+CONFIG_COMEDI_ADV_PCI1720=m
+CONFIG_COMEDI_ADV_PCI1723=m
+CONFIG_COMEDI_ADV_PCI1724=m
+CONFIG_COMEDI_ADV_PCI1760=m
+CONFIG_COMEDI_ADV_PCI_DIO=m
+CONFIG_COMEDI_NI_LABPC_PCI=m
+CONFIG_COMEDI_NI_PCIDIO=m
+CONFIG_COMEDI_NI_PCIMIO=m
+CONFIG_STAGING=y
+CONFIG_R8188EU=m
+# CONFIG_88EU_AP_MODE is not set
+CONFIG_PM_DEVFREQ=y
+CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
+CONFIG_DEVFREQ_GOV_PERFORMANCE=y
+CONFIG_DEVFREQ_GOV_POWERSAVE=y
+CONFIG_DEVFREQ_GOV_USERSPACE=y
+CONFIG_PWM=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_FS_POSIX_ACL=y
+CONFIG_EXT3_FS_SECURITY=y
+CONFIG_XFS_FS=y
+CONFIG_XFS_QUOTA=y
+CONFIG_XFS_POSIX_ACL=y
+CONFIG_BTRFS_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
+CONFIG_QUOTA=y
+# CONFIG_PRINT_QUOTA_WARNING is not set
+CONFIG_QFMT_V1=m
+CONFIG_QFMT_V2=m
+CONFIG_AUTOFS4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_OVERLAY_FS=y
+CONFIG_OVERLAY_FS_INDEX=y
+CONFIG_OVERLAY_FS_XINO_AUTO=y
+CONFIG_OVERLAY_FS_METACOPY=y
+CONFIG_FSCACHE=y
+CONFIG_ISO9660_FS=y
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_UDF_FS=y
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=m
+CONFIG_FAT_DEFAULT_CODEPAGE=936
+CONFIG_FAT_DEFAULT_IOCHARSET="gb2312"
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+CONFIG_CONFIGFS_FS=y
+CONFIG_HFS_FS=m
+CONFIG_HFSPLUS_FS=m
+CONFIG_CRAMFS=m
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XATTR=y
+CONFIG_SQUASHFS_LZ4=y
+CONFIG_SQUASHFS_LZO=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_NFSD=y
+CONFIG_NFSD_V3_ACL=y
+CONFIG_NFSD_V4=y
+CONFIG_NFSD_BLOCKLAYOUT=y
+CONFIG_CIFS=m
+# CONFIG_CIFS_DEBUG is not set
+CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_936=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_UTF8=y
+CONFIG_KEY_DH_OPERATIONS=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_SELINUX_BOOTPARAM=y
+CONFIG_SECURITY_SELINUX_DISABLE=y
+CONFIG_SECURITY_APPARMOR=y
+CONFIG_SECURITY_YAMA=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_CRYPTO_USER=m
+# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
+CONFIG_CRYPTO_PCRYPT=m
+CONFIG_CRYPTO_CRYPTD=m
+CONFIG_CRYPTO_CHACHA20POLY1305=m
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_VMAC=m
+CONFIG_CRYPTO_TGR192=m
+CONFIG_CRYPTO_WP512=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_KHAZAD=m
+CONFIG_CRYPTO_SALSA20=m
+CONFIG_CRYPTO_SEED=m
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_DEFLATE=m
+CONFIG_CRYPTO_LZO=m
+CONFIG_CRYPTO_842=m
+CONFIG_CRYPTO_LZ4=m
+CONFIG_CRYPTO_LZ4HC=m
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
+CONFIG_CRYPTO_USER_API_AEAD=m
+CONFIG_PRINTK_TIME=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_SCHEDSTATS=y
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_FTRACE is not set
-- 
2.27.0

